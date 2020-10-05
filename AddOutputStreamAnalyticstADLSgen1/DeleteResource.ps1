[CmdletBinding()]
param (
     $ResourceDeploy    = $true
    ,$TenantId          = ""
    ,$ClientId          = ""
    ,$ClientSecret      = ""
    ,$Resource          = ""
    ,$SubscriptionId    = ""
)
if (Get-InstalledModule -Name Az -AllVersions -ErrorVariable notPresent -ErrorAction SilentlyContinue) {
    Write-Host "AZ Module exists"
} 
else {
    Write-Host "AZ Module does not exist"
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}
# Connect to Azure
az login --service-principal --username $ClientId --password $ClientSecret --tenant $TenantId
az account set --subscription $SubscriptionId

#endregion

if ([System.Convert]::ToBoolean($ResourceDeploy) -eq $false){
    az resource delete --ids $Resource
}