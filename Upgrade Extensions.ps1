Set-ExecutionPolicy RemoteSigned
# Import the module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'

# Get Information of the app
Get-NAVAppInfo -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)"

# Uninstall the old version of the app
Uninstall-NAVApp -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)"

# Publish the new version of the app
Publish-NAVApp -ServerInstance BC130 -path "C:\Users\Admin\Desktop\AL\TestExtension\Default publisher_TestExtension_1.0.0.0.app" 

# Synchronize the tenant
Sync-NAVTenant -ServerInstance BC130 

# Synchronize the app
sync-NAVApp -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)" -Version 1.0.0.0

# Execute the upgrade codeunits
Start-NAVAppDataUpgrade -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)" -Version 1.0.0.0

# Install the new version of the app
install-NAVApp -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)" -Version 1.0.0.0

# Unpublish the old version of the app
UnPublish-NAVApp -ServerInstance BC130 -Name "Kevins Kawaii Kohais (DK)" -Version 1.0.0.0

