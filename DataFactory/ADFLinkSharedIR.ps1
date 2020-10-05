[CmdletBinding()]
param (
    $ResourceDeploy = $true
    , $TenantId = "cc251925-4d3d-43c3-808e-774f6ff0366b" # Enter Tenant Id.
    , $ClientId = "c9c428d0-8898-43c8-a7c2-6039407edffc" # Enter Client Id.
    , $ClientSecret = "540d2457-53d3-4450-926c-18e001a51486" # Enter Client Secret.
    , $SubscriptionId = "***f"                                 # Enter Subscription Id.

    , $SharedDataFactoryName = "idl-dfcv2-prd-weeu"                   # datafactory de prod
    , $SharedIntegrationRuntimeName = "MAIN"                                 # IR HORS PROD
    , $SharedResourceGroupName = "RG-TOTAL-P-NE-IndustrialDataLake" 
    , $SharedSubscriptionId = "38d63019-c94c-4f3b-ae71-42c8624b7cc3" # TOTAL PROD

    , $LinkedDataFactoryName = "adf-davidtest-tf"
    , $LinkedResourceGroupName = "RG-TF-MGT-DV-NE-TGS-DAVIDTEST" 
)

#region : Install module et connection
if (Get-InstalledModule -Name Az -AllVersions -ErrorVariable notPresent -ErrorAction SilentlyContinue) {
    Write-Host "AZ Module exists"
} 
else {
    Write-Host "AZ Module does not exist"
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}

# Connect to Azure
$Username = $ClientId
$Password = $ClientSecret | ConvertTo-SecureString -AsPlainText -Force
$creds = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $Username, $Password
 
 
Connect-AzAccount -Credential $creds -ServicePrincipal -Tenant $TenantId
$context = Get-AzSubscription -SubscriptionId $SubscriptionId
Set-AzContext $context
#endregion


if ([System.Convert]::ToBoolean($ResourceDeploy)) {
    
    # Test if the linked IR already exists
    $ExistingIR = Get-AzDataFactoryV2IntegrationRuntime `
        -ResourceGroupName $LinkedResourceGroupName `
        -DataFactoryName $LinkedDataFactoryName `
        -Name $SharedIntegrationRuntimeName  -ErrorVariable notPresent -ErrorAction SilentlyContinue
    
    if ($null -eq $ExistingIR) {
        Write-Host "Create the Linked IR"
        # Change Subscription to shared
        $context = Get-AzSubscription -SubscriptionId $SharedSubscriptionId
        Set-AzContext $context
        Get-AzContext
    
        # Get the Shared ADF Integration Runtime
        $SharedIR = Get-AzDataFactoryV2IntegrationRuntime `
            -ResourceGroupName $SharedResourceGroupName `
            -DataFactoryName $SharedDataFactoryName `
            -Name $SharedIntegrationRuntimeName
        
    
        # Get-AzRoleAssignment -ObjectId $factory.Identity.PrincipalId-Scope $SharedIR.Id
        # Change Subscription to link
        $context = Get-AzSubscription -SubscriptionId $SubscriptionId
        Set-AzContext $context
        Get-AzContext
    
        # Get the ADF to link to	
        $factory = Get-AzDataFactoryV2 -ResourceGroupName $LinkedResourceGroupName `
            -Name $LinkedDataFactoryName
    
        # Grant access to linked ADF MSI to the shared ADF IR 
        New-AzRoleAssignment  -RoleDefinitionName Contributor `
            -Scope $SharedIR.Id `
            -ObjectId $factory.Identity.PrincipalId `
            -ErrorVariable notPresent -ErrorAction SilentlyContinue
    
        Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $LinkedResourceGroupName `
            -DataFactoryName $LinkedDataFactoryName `
            -Name $SharedIntegrationRuntimeName `
            -Type SelfHosted `
            -SharedIntegrationRuntimeResourceId $SharedIR.Id  `
            -Description $SharedIntegrationRuntimeName  `
            -Force
    }
    else {
        Write-Host "LInked IR already exists"
    }
    
}
else {

    # Test if the linked IR already exists
    $ExistingIR = Get-AzDataFactoryV2IntegrationRuntime `
        -ResourceGroupName $LinkedResourceGroupName `
        -DataFactoryName $LinkedDataFactoryName `
        -Name $SharedIntegrationRuntimeName  -ErrorVariable notPresent -ErrorAction SilentlyContinue
    
    if ($null -ne $ExistingIR) {
    
        Write-Host "Destroy role contrib to main AzDataFactoryV2IntegrationRuntime"
        # Change Subscription to shared
        $context = Get-AzSubscription -SubscriptionId $SharedSubscriptionId
        Set-AzContext $context
        Get-AzContext

        # Get the Shared ADF Integration Runtime
        $SharedIR = Get-AzDataFactoryV2IntegrationRuntime `
            -ResourceGroupName $SharedResourceGroupName `
            -DataFactoryName $SharedDataFactoryName `
            -Name $SharedIntegrationRuntimeName
        

        # Get-AzRoleAssignment -ObjectId $factory.Identity.PrincipalId-Scope $SharedIR.Id
        # Change Subscription to link
        $context = Get-AzSubscription -SubscriptionId $SubscriptionId
        Set-AzContext $context
        Get-AzContext

        # Get the ADF to link to	
        $factory = Get-AzDataFactoryV2 -ResourceGroupName $LinkedResourceGroupName `
            -Name $LinkedDataFactoryName

        # Remove Grant access to linked ADF MSI to the shared ADF IR 
        Remove-AzRoleAssignment  -RoleDefinitionName Contributor `
            -Scope $SharedIR.Id `
            -ObjectId $factory.Identity.PrincipalId `
            -PassThru -ErrorVariable notPresent -ErrorAction SilentlyContinue

        Remove-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $LinkedResourceGroupName `
            -DataFactoryName $LinkedDataFactoryName `
            -Name $SharedIntegrationRuntimeName `
            -Force
    }
}