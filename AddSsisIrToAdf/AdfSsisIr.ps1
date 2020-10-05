[CmdletBinding()]
param (
     $ResourceDeploy         = $true
    ,$TenantId               = "cc251925-4d3d-43c3-808e-774f6ff0366b" 
    ,$ClientId               = "c9c428d0-8898-43c8-a7c2-6039407edffc" 
    ,$ClientSecret           = "540d2457-53d3-4450-926c-18e001a51486" 
    ,$SubscriptionId         = "***"
    ,$ResourceGroupName      = "RG-TOTAL-DV-NE-TG-PATTERN1"
    ,$DataFactoryName        = "adf-dv-ne-iqy9v6x1"
    ,$DataFactoryLocation    = "North Europe"

    ### Azure-SSIS integration runtime info - This is a Data Factory compute resource for running SSIS packages.
    ,$AzureSSISName          = "AzureSSISName"
    ,$AzureSSISDescription   = "AzureSSISDescription"
    ,$AzureSSISLocation      = $DataFactoryLocation 
    ,$AzureSSISNodeSize      = "Standard_D8_v3"
    ,$AzureSSISNodeNumber    = 2 
    ,$AzureSSISEdition       = "Standard" 
    ,$AzureSSISLicenseType   = "LicenseIncluded" 
    ,$AzureSSISMaxParallelExecutionsPerNode = 8 

    # Custom setup info: Standard/express custom setups
    ,$SetupScriptContainerSasUri = "" 
    ,$ExpressCustomSetup         = "" 

    # Virtual network info: Classic or Azure Resource Manager
    ,$VnetId         = "" 
    ,$SubnetName     = "" 
    ,$FirstPublicIP  = ""
    ,$SecondPublicIP = ""

    ### SSISDB info
    ,$SSISDBServerEndpoint      = "sqlsrv-dv-ne-iqy9v6x1.database.windows.net" 
    ,$SSISDBServerAdminUserName = ""
    ,$SSISDBServerAdminPassword = ""
    ,$SSISDBPricingTier         = "S0"

    ### Self-hosted integration runtime info - This can be configured as a proxy for on-premises data access 
    ,$DataProxyIntegrationRuntimeName   = "" 
    ,$DataProxyStagingLinkedServiceName = "" 
    ,$DataProxyStagingPath              = "" 

    ,$SqlAdAdminGroupName                = ""

)

#region : Install module et connection
if (Get-InstalledModule -Name Az -AllVersions -ErrorVariable notPresent -ErrorAction SilentlyContinue) {
    Write-Host "AZ Module exists"
} 
else {
    Write-Host "AZ Module does not exist"
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}


$Username = $ClientId
$Password = $ClientSecret | ConvertTo-SecureString -AsPlainText -Force
$creds = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $Username,$Password

Connect-AzAccount -Credential $creds -ServicePrincipal -Tenant $TenantId
# Set the subscription
$context = Get-AzSubscription -SubscriptionId $SubscriptionId
Set-AzContext $context

#endregion

if([System.Convert]::ToBoolean($ResourceDeploy))
{
    
    #region : Add ADF identity managed into owner group
    $factory = Get-AzDataFactoryV2 -ResourceGroupName $ResourceGroupName -Name $DataFactoryName
    $AdfIdentity = $factory.Identity.PrincipalId
    $SqlAdAdminGroup = Get-AzADGroup -DisplayName $SqlAdAdminGroupName

    if($null -eq (Get-AzADGroupMember -GroupObjectId $SqlAdAdminGroup.Id | Where-Object {$_.id -EQ $AdfIdentity})) {
        try {
            Add-AzADGroupMember -TargetGroupObjectId $SqlAdAdminGroup.Id -MemberObjectId $AdfIdentity
        }
        catch {
            Write-Host "ERROR!" -ForegroundColor 'Red'
            throw $_
        }
    } 
    else {
        write-host("Add ADF managed Identity into the [$SqlAdAdminGroupName] already exists")
    }
    #endregion


    #region : Validate the connection to the database server
    # Validate only if you use SSISDB and don't use a virtual network or Azure AD authentication
    if(![string]::IsNullOrEmpty($SSISDBServerEndpoint))
    {
        if([string]::IsNullOrEmpty($VnetId) -and [string]::IsNullOrEmpty($SubnetName))
        {
            if(![string]::IsNullOrEmpty($SSISDBServerAdminUserName) -and ![string]::IsNullOrEmpty($SSISDBServerAdminPassword))
            {
                $SSISDBConnectionString = "Data Source=" + $SSISDBServerEndpoint + ";User ID=" + $SSISDBServerAdminUserName + ";Password=" + $SSISDBServerAdminPassword
                $sqlConnection = New-Object System.Data.SqlClient.SqlConnection $SSISDBConnectionString;
                Try
                {
                    $sqlConnection.Open();
                }
                Catch [System.Data.SqlClient.SqlException]
                {
                    Write-Warning "Cannot connect to your Azure SQL Database server, exception: $_";
                    Write-Warning "Please make sure the server you specified has already been created. Do you want to proceed? [Y/N]"
                    $yn = Read-Host
                    if(!($yn -ieq "Y"))
                    {
                        Return;
                    }
                }
            }
        }
    }
    #endregion

    #region : Configure a virtual network
    # Make sure to run this script against the subscription to which the virtual network belongs
    if(![string]::IsNullOrEmpty($VnetId) -and ![string]::IsNullOrEmpty($SubnetName))
    {
        # Register to the Azure Batch resource provider
        $BatchApplicationId = "ddbf3205-c6bd-46ae-8127-60eb93363864"
        $BatchObjectId = (Get-AzADServicePrincipal -ServicePrincipalName $BatchApplicationId).Id
        Register-AzResourceProvider -ProviderNamespace Microsoft.Batch
        while(!(Get-AzResourceProvider -ProviderNamespace "Microsoft.Batch").RegistrationState.Contains("Registered"))
        {
        Start-Sleep -s 10
        }
        if($VnetId -match "/providers/Microsoft.ClassicNetwork/")
        {
            # Assign the VM contributor role to Microsoft.Batch
            New-AzRoleAssignment -ObjectId $BatchObjectId -RoleDefinitionName "Classic Virtual Machine Contributor" -Scope $VnetId
        }
    }
    #endregion

    # ============================================================================================================
    # Start of script
    # ============================================================================================================

    #region : Create an integration runtime
    Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
        -DataFactoryName $DataFactoryName `
        -Name $AzureSSISName `
        -Description $AzureSSISDescription `
        -Type Managed `
        -Location $AzureSSISLocation `
        -NodeSize $AzureSSISNodeSize `
        -NodeCount $AzureSSISNodeNumber `
        -Edition $AzureSSISEdition `
        -LicenseType $AzureSSISLicenseType `
        -MaxParallelExecutionsPerNode $AzureSSISMaxParallelExecutionsPerNode `
        -VnetId $VnetId `
        -Subnet $SubnetName `
        -Force

    #endregion

    #region : Add CatalogServerEndpoint, CatalogPricingTier, and CatalogAdminCredential parameters if you use SSISDB
    if(![string]::IsNullOrEmpty($SSISDBServerEndpoint))
    {
        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -CatalogServerEndpoint $SSISDBServerEndpoint `
            -CatalogPricingTier $SSISDBPricingTier `
            -Force
        

        # Add the CatalogAdminCredential parameter if you don't use Azure AD authentication
        if(![string]::IsNullOrEmpty($SSISDBServerAdminUserName) –and ![string]::IsNullOrEmpty($SSISDBServerAdminPassword)) 
        {
            $secpasswd = ConvertTo-SecureString $SSISDBServerAdminPassword -AsPlainText -Force
            $serverCreds = New-Object System.Management.Automation.PSCredential($SSISDBServerAdminUserName, $secpasswd)

            Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
                -DataFactoryName $DataFactoryName `
                -Name $AzureSSISName `
                -CatalogAdminCredential $serverCreds `
                -Force
            
        }
    }
    #endregion

    #region : Add custom setup parameters if you use standard/express custom setups
    if(![string]::IsNullOrEmpty($SetupScriptContainerSasUri))
    {
        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -SetupScriptContainerSasUri $SetupScriptContainerSasUri `
            -Force
        
    }
    if(![string]::IsNullOrEmpty($ExpressCustomSetup))
    {
        if($ExpressCustomSetup -eq "RunCmdkey")
        {
            $addCmdkeyArgument = "YourFileShareServerName or YourAzureStorageAccountName.file.core.windows.net"
            $userCmdkeyArgument = "YourDomainName\YourUsername or azure\YourAzureStorageAccountName"
            $passCmdkeyArgument = New-Object Microsoft.Azure.Management.DataFactory.Models.SecureString("YourPassword or YourAccessKey")
            $setup = New-Object Microsoft.Azure.Management.DataFactory.Models.CmdkeySetup($addCmdkeyArgument, $userCmdkeyArgument, $passCmdkeyArgument)
        }
        if($ExpressCustomSetup -eq "SetEnvironmentVariable")
        {
            $variableName = "YourVariableName"
            $variableValue = "YourVariableValue"
            $setup = New-Object Microsoft.Azure.Management.DataFactory.Models.EnvironmentVariableSetup($variableName, $variableValue)
        }
        if($ExpressCustomSetup -eq "SentryOne.TaskFactory")
        {
            $licenseKey = New-Object Microsoft.Azure.Management.DataFactory.Models.SecureString("YourLicenseKey")
            $setup = New-Object Microsoft.Azure.Management.DataFactory.Models.ComponentSetup($ExpressCustomSetup, $licenseKey)
        }
        if($ExpressCustomSetup -eq "oh22is.SQLPhonetics.NET")
        {
            $licenseKey = New-Object Microsoft.Azure.Management.DataFactory.Models.SecureString("YourLicenseKey")
            $setup = New-Object Microsoft.Azure.Management.DataFactory.Models.ComponentSetup($ExpressCustomSetup, $licenseKey)
        }
        if($ExpressCustomSetup -eq "oh22is.HEDDA.IO")
        {
            $setup = New-Object Microsoft.Azure.Management.DataFactory.Models.ComponentSetup($ExpressCustomSetup)
        }
        # Create an array of one or more express custom setups
        $setups = New-Object System.Collections.ArrayList
        $setups.Add($setup)

        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -ExpressCustomSetup $setups `
            -Force
        
    }
    #endregion

    #region : Add self-hosted integration runtime parameters if you configure a proxy for on-premises data accesss
    if(![string]::IsNullOrEmpty($DataProxyIntegrationRuntimeName) -and ![string]::IsNullOrEmpty($DataProxyStagingLinkedServiceName))
    {
        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -DataProxyIntegrationRuntimeName $DataProxyIntegrationRuntimeName `
            -DataProxyStagingLinkedServiceName $DataProxyStagingLinkedServiceName `
            -Force
        

        if(![string]::IsNullOrEmpty($DataProxyStagingPath))
        {
            Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
                -DataFactoryName $DataFactoryName `
                -Name $AzureSSISName `
                -DataProxyStagingPath $DataProxyStagingPath `
                -Force
            
        }
    }
    #endregion

    #region : Add public IP address parameters if you bring your own static public IP addresses
    if(![string]::IsNullOrEmpty($FirstPublicIP) -and ![string]::IsNullOrEmpty($SecondPublicIP))
    {
        $publicIPs = @($FirstPublicIP, $SecondPublicIP)
        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -PublicIPs $publicIPs `
            -Force
        
    }
    #endregion

    #region : Start the integration runtime
    write-host("##### Starting #####")
    Start-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
        -DataFactoryName $DataFactoryName `
        -Name $AzureSSISName `
        -Force

    write-host("##### Completed #####")
    write-host("If any cmdlet is unsuccessful, please consider using -Debug option for diagnostics.")
    #endregion

}
else{

    #region : Remove ADF identity managed into owner group
    $factory = Get-AzDataFactoryV2 -ResourceGroupName $ResourceGroupName -Name $DataFactoryName
    $AdfIdentity = $factory.Identity.PrincipalId
    $SqlAdAdminGroup = Get-AzADGroup -DisplayName $SqlAdAdminGroupName

    if($null -ne (Get-AzADGroupMember -GroupObjectId $SqlAdAdminGroup.Id | Where-Object {$_.id -EQ $AdfIdentity})) {
        try {
            Remove-AzADGroupMember -GroupObjectId $SqlAdAdminGroup.Id -MemberObjectId $AdfIdentity -PassThru
        }
        catch {
            Write-Host "ERROR!" -ForegroundColor 'Red'
            throw $_
        }
    } 
    else {
        write-host("Remove ADF managed Identity into the [$SqlAdAdminGroupName] already done")
    }
    #endregion

    write-host("##### Stoping #####")
    Stop-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
        -DataFactoryName $DataFactoryName `
        -Name $AzureSSISName `
        -Force

    write-host("##### Stoping Completed #####")


    Remove-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
            -DataFactoryName $DataFactoryName `
            -Name $AzureSSISName `
            -Force
    write-host("##### Remove Completed #####")

}
