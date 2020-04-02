
#Creating CSV Reports with PowerCLI
#All credit to Dave Pinkawa
#https://caffeinatedlifestyle.com/
#https://adamtheautomator.com/powercli-tutorial/

#Take the VM Sort through the object info asnd pull out the names | pipe that into another command and save the information as table columns
# take the info and add that to the proper rows in CSV
Get-VM | Sort-Object -Property Name | Get-View -Property @("Name", "Config.GuestFullName", "Guest.GuestFullName") |
Select -Property Name, @{N="Configured OS";E={$_.Config.GuestFullName}}, @{N="Running OS";E={$_.Guest.GuestFullName}} | Export-CSV C:\report.csv -NoTypeInformation