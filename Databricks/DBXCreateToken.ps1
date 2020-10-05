[CmdletBinding()]
param (
     $ResourceDeploy    = $true
    ,$TenantId          = ""
    ,$ClientId          = ""
    ,$ClientSecret      = ""
    ,[Parameter(mandatory=$false)] $Region = ""
    ,[Parameter(mandatory=$false)] $Resourcegroup = ""
    ,$Resource          = ""
    ,$SubscriptionId    = ""
    ,$vaultName         = ""
)

#region : Install module et connection
if (Get-Module -ListAvailable -Name azure.databricks.cicd.tools) {
    Write-Host "azure.databricks.cicd.tools Module exists"
} 
else {
    Write-Host "azure.databricks.cicd.tools Module does not exist"
    Install-Module -Name azure.databricks.cicd.tools -MinimumVersion 2.0.39 -Force -Scope CurrentUser
}
if (Get-InstalledModule -Name Az -AllVersions -ErrorVariable notPresent -ErrorAction SilentlyContinue) {
    Write-Host "AZ Module exists"
} 
else {
    Write-Host "AZ Module does not exist"
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}

# Connect to Azure
$Username       = $ClientId
$Password       = $ClientSecret | ConvertTo-SecureString -AsPlainText -Force
$creds          = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $Username,$Password

Connect-AzAccount -Credential $creds -ServicePrincipal -Tenant $TenantId
$context        = Get-AzSubscription -SubscriptionId $SubscriptionId
Set-AzContext $context

#endregion


if ([System.Convert]::ToBoolean($ResourceDeploy)){

    # https://westeurope.azuredatabricks.net
    
    Connect-Databricks -Region $Region -ApplicationId $ClientId -Secret $ClientSecret `
                -ResourceGroupName $Resourcegroup `
                -SubscriptionId $SubscriptionId `
                -WorkspaceName $Resource `
                -TenantId $TenantId

    $body = @{
        lifetime_seconds = 1000000000000
        comment = "This token is automatically created by DevOps."
    }
    $out = Invoke-DatabricksAPI -API "api/2.0/token/create" -Method POST -Body $body
    
    $out.token_info
    $out.token_value

    $Secret_ArmAccessKey = ConvertTo-SecureString -String $out.token_value -AsPlainText -Force

    if($null -eq (Get-AzKeyVaultSecret -VaultName $vaultName -Name 'DBX-TOKEN-KEY')) {
        try {
            Set-AzKeyVaultSecret -VaultName $vaultName -Name 'DBX-TOKEN-KEY' -SecretValue $Secret_ArmAccessKey
        } catch {
            Write-Host "ERROR!" -ForegroundColor 'Red'
            throw $_
        } 
    }

} else {
    if($null -ne (Get-AzKeyVaultSecret -VaultName $vaultName -Name 'DBX-TOKEN-KEY') ){
        Write-Host "Remove AKV Secret." 
        Remove-AzKeyVaultSecret -VaultName $vaultName -Name 'DBX-TOKEN-KEY' -Force -PassThru -InRemovedState
    }
}