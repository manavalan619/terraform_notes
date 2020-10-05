[CmdletBinding()]
param (
     $AppgwUserAssignedIdentity    = ""
    ,$AadTargetGroup     = ""
    ,$TenantId           = ""
    ,$ClientId           = ""
    ,$ClientSecret       = ""
    ,[Parameter(mandatory=$false)] $Resourcegroup = ""
    ,$SubscriptionId     = ""
)
#region : Install module et connection
if (Get-InstalledModule -Name Az -AllVersions -ErrorVariable notPresent -ErrorAction SilentlyContinue) {
    Write-Host "AZ Module exists"
} 
else {
    Write-Host "AZ Module does not exist"
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}
if (Get-Module -ListAvailable -Name Az.ManagedServiceIdentity) {
    Write-Host "Az.ManagedServiceIdentity Module exists"
} 
else {
    Write-Host "Az.ManagedServiceIdentity Module does not exist"
    Install-Module -Name Az.ManagedServiceIdentity -MinimumVersion 0.7.3 -Force -Scope CurrentUser
}

# Connect to Azure
$Username       = $ClientId
$Password       = $ClientSecret | ConvertTo-SecureString -AsPlainText -Force
$creds          = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $Username,$Password

Connect-AzAccount -Credential $creds -ServicePrincipal -Tenant $TenantId
$context        = Get-AzSubscription -SubscriptionId $SubscriptionId
Set-AzContext $context

#endregion


#region function : Helper for padded messages
function Write-HostPadded {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Message,

        [Parameter(Mandatory = $false)]
        [String]
        $ForegroundColor,

        [Parameter(Mandatory = $false)]
        [Int]
        $PadLength = 80,

        [Parameter(Mandatory = $false)]
        [Switch]
        $NoNewline
    )

    $writeHostParams = @{
        Object = $Message.PadRight($PadLength, '.')
    }

    if ($ForegroundColor) {
        $writeHostParams.Add('ForegroundColor', $ForegroundColor)
    }

    if ($NoNewline.IsPresent) {
        $writeHostParams.Add('NoNewline', $true)
    }

    Write-Host @writeHostParams
}
#endregion



#region AAD : Add Application Gateway User Assigned Identity to aad group "ZG-AZR-TGS-CERT-READER"

$taskMessage = "Add Application Gateway User Assigned Identity to aad group ZG-AZR-TGS-CERT-READER: [$AppgwUserAssignedIdentity]"
Write-HostPadded -Message "`n$taskMessage ..." -NoNewline

# $terraformSP = Get-AzADServicePrincipal -DisplayName $ServicePrincipalName
$AppgwUserAssignedIdentity = Get-AzUserAssignedIdentity -ResourceGroupName $Resourcegroup -Name $AppgwUserAssignedIdentity 

# $AppgwUserAssignedIdentity = Get-AzUserAssignedIdentity -ResourceGroupName RG-TOTAL-DV-WE-TGS-PAT5TST -Name app-gw-user-identity-pat5tst-dv

$AppgwUserAssignedIdentity_spID = $AppgwUserAssignedIdentity.principalid

$Grp = Get-AzADGroup -DisplayName $AadTargetGroup

 if($null -eq (Get-AzADGroupMember -GroupObjectId $Grp.Id | Where-Object {$_.id -EQ $AppgwUserAssignedIdentity_spID})) {
    try {
        Add-AzADGroupMember -TargetGroupObjectId $Grp.Id -MemberObjectId $AppgwUserAssignedIdentity_spID
    }
    catch {
        Write-Host "ERROR!" -ForegroundColor 'Red'
        throw $_
    }
} 
else {
    Write-HostPadded -Message "Add Application Gateway User Assigned Identity to aad group ZG-AZR-TGS-CERT-READER [$AppgwUserAssignedIdentity] already exists"
}

#endregion