<#
.SYNOPSIS
    Windows audit
.DESCRIPTION
    This should help you to audit a virtual/physical windows machine without having to get into the nitty gritty of things.
.NOTES
    File Name      : winaudit0.1.ps1
    Author         : gajendra d ambi
    Date           : November 2015
    Prerequisite   : PowerShell v4+ over windows.
    Copyright      - None
    0.0            : hostname,fqdn,domain,dns,timezone,ip,subnet,gateway,OS,description,storage,cpu,ram,applications,
    0.1            : odbc, windows & SQL activation
.LINK
    Script posted over: https://github.com/gajuambi/windows
    
#>

#Start of the script

$netbios  = hostname.exe
$winaudit = "$PSScriptRoot\$netbios.html"
ni -ItemType file $winaudit -Force

#title
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="navy" cellspacing="0" cellpadding="0"><tr><td><font face="Impact,Candara,Algerian" size="9" color="white"><center>Windows Audit</center></font></td></tr></table><br>'

ac $winaudit '<!DOCTYPE html>'
ac $winaudit '<html>'
ac $winaudit '<head>'
ac $winaudit '<title>Windows Audit</title>'
ac $winaudit '</head>'
ac $winaudit '<body bgcolor="#E8E8E8">'
ac $winaudit '<table border=5px width="100%" cellspacing="0">'

#Section
Write-Host "collecting Section 1 : Windows Information"
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>Section 1 : Windows Information</b></p></font></td></tr></table>'
#main table
ac $winaudit '<table style="border:1px solid black" width="100%" bgcolor="#e1e1e1" cellspacing="0" cellpadding="0"<TR><TD>'
#subtable
ac $winaudit '<table border="1px" width="100%" bgcolor="white" cellspacing="0" cellpadding="0">'
#colors from http://www.color-hex.com/
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Name</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Domain</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">OperatingSystem</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">activation</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Architecture</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Build</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Description</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">IP</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Subnet</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Gateway</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">DNS</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Timezone</font></th>'

$Name            = $env:computername
$Domain          = $env:userdnsdomain
$OperatingSystem = (gwmi Win32_OperatingSystem).Caption
$activation      = (Get-CimInstance -ClassName SoftwareLicensingProduct | where ApplicationId -EQ 55c92734-d682-4d71-983e-d6ec3f16059f | where PartialProductKey).LicenseStatus
$Architecture    = (gwmi Win32_OperatingSystem).OSArchitecture
$Build           = (gwmi Win32_OperatingSystem).BuildNumber
$Description     = (gwmi Win32_OperatingSystem).Description
$IP              = (gwmi Win32_NetworkAdapterConfiguration | where IPAddress -ne $null).IPAddress
$Subnet          = (gwmi Win32_NetworkAdapterConfiguration | where IPAddress -ne $null).IPSubnet
$Gateway         = (gwmi Win32_NetworkAdapterConfiguration | where IPAddress -ne $null).DefaultIPGateway
$DNS             = (gwmi Win32_NetworkAdapterConfiguration | where IPAddress -ne $null).DNSServerSearchOrder
$Timezone        = ([System.TimeZone]::CurrentTimeZone).DaylightName

write-host "collecting basic information about the host $netbios" -foregroundcolor green
#start of a new row
ac $winaudit "<TR>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Name</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Domain</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$OperatingSystem</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$activation</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Architecture</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Build</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Description</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$IP</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Subnet</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Gateway</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$DNS</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Timezone</font></p>"
ac $winaudit "</TD>"

#end of row
ac $winaudit "</TR>"

#Ending & fixing the position of the table
ac $winaudit "</TD></TR></table>"
ac $winaudit "</table><P>"
ac $winaudit "<br><br>"

#Section
Write-Host "collecting Section 2 : Windows Configuration"
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>Section 2 : Windows Configuration</b></p></font></td></tr></table>'
#main table
ac $winaudit '<table style="border:1px solid black" width="100%" bgcolor="#e1e1e1" cellspacing="0" cellpadding="0"<TR><TD>'
#subtable
ac $winaudit '<table border="1px" width="100%" bgcolor="white" cellspacing="0" cellpadding="0">'
#colors from http://www.color-hex.com/
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Name</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Ram</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Sockets</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Cores</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Users</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">DriveID</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Volumes</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Disksize[GB]</font></th>'


$Name      = $env:computername
$Ram       = [string]::Join(", ",(gwmi -class win32_physicalmemory | ForEach-Object {[math]::truncate($_.capacity / 1GB)}))
$Sockets   = [string]::Join(", ",(gwmi -Class Win32_Processor).NumberOfLogicalProcessors)
$Cores     = [string]::Join(", ",(gwmi -Class Win32_Processor).NumberOfCores)
$Users     = [string]::Join(", ",(gwmi -Class Win32_UserAccount).Name)

$Volumecount   = (gwmi Win32_LogicalDisk).count

write-host "collecting basic configuration of the host $netbios" -foregroundcolor green
#start of a new row
ac $winaudit "<TR>"

ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$Volumecount>"
ac $winaudit "<p><font color='#196aa5'>$Name</font></p>"    
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$Volumecount>"
ac $winaudit "<p><font color='#196aa5'>$Ram</font></p>"     
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$Volumecount>"
ac $winaudit "<p><font color='#196aa5'>$Sockets</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$Volumecount>"
ac $winaudit "<p><font color='#196aa5'>$Cores</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$Volumecount>"
ac $winaudit "<p><font color='#196aa5'>$Users</font></p>"
ac $winaudit "</TD>"

foreach ($volume in (gwmi Win32_LogicalDisk).VolumeName) {
$DriveID   = (gwmi Win32_LogicalDisk | where VolumeName -EQ $volume).DeviceID

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$DriveID</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Volume</font></p>"
ac $winaudit "</TD>"

   $Disksize  = [math]::truncate((gwmi Win32_LogicalDisk | where VolumeName -EQ $volume).Size / 1GB)

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Disksize</font></p>"
ac $winaudit "</TD>"

#end of row
ac $winaudit "</TR>"
}

#Ending & fixing the position of the table
ac $winaudit "</TD></TR></table>"
ac $winaudit "</table><P>"
ac $winaudit "<br><br>"

#Section 3
Write-Host "collecting Section 3 : Software"
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>Section 3 : Software</b></p></font></td></tr></table>'
#main table
ac $winaudit '<table style="border:1px solid black" width="100%" bgcolor="#e1e1e1" cellspacing="0" cellpadding="0"<TR><TD>'
#subtable
ac $winaudit '<table border="1px" width="100%" bgcolor="white" cellspacing="0" cellpadding="0">'
#colors from http://www.color-hex.com/
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Computer</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Software</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Version</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Vendor</font></th>'

$count     = ((Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where Publisher -notlike "Microsoft*").DisplayName).count
$Computer  = $env:computername

write-host "collecting the information about installed softwares (except those from microsoft) in $netbios" -foregroundcolor green

#start of a new row
ac $winaudit "<TR>"

ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$count>"
ac $winaudit "<p><font color='#196aa5'>$Computer</font></p>"    
ac $winaudit "</TD>"                                        

foreach ($Software in (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where Publisher -notlike "Microsoft*").DisplayName) {

$Version   = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where Publisher -notlike "Microsoft*" | where DisplayName -EQ $Software).DisplayVersion
$Vendor    = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where Publisher -notlike "Microsoft*" | where DisplayName -EQ $Software).Publisher
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Software</font></p>"
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Version</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Vendor</font></p>"
ac $winaudit "</TD>"

#end of row
ac $winaudit "</TR>"

}

#Ending & fixing the position of the table
ac $winaudit "</TD></TR></table>"
ac $winaudit "</table><P>"
ac $winaudit "<br><br>"

#Section 4
Write-Host "collecting Section 4 : ODBC"

if ((get-odbcdsn) -ne $null) {

ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>Section 4 : ODBC</b></p></font></td></tr></table>'
#main table
ac $winaudit '<table style="border:1px solid black" width="100%" bgcolor="#e1e1e1" cellspacing="0" cellpadding="0"<TR><TD>'
#subtable
ac $winaudit '<table border="1px" width="100%" bgcolor="white" cellspacing="0" cellpadding="0">'
#colors from http://www.color-hex.com/
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Name</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">DsnType</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Platform</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">DriverName</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Description</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Server</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Trusted_Connection</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Database</font></th>'

$Name               = (get-odbcdsn).Name
$DsnType            = (get-odbcdsn).DsnType
$Platform           = (get-odbcdsn).Platform
$DriverName         = (get-odbcdsn).DriverName
$Description        = (get-odbcdsn).Attribute.Description
$Server             = (get-odbcdsn).Attribute.Server
$Trusted_Connection = (get-odbcdsn).Attribute.Trusted_Connection
$Database           = (get-odbcdsn).Attribute.Database

write-host "collecting the information about installed softwares (except those from microsoft) in $netbios" -foregroundcolor green

#start of a new row
ac $winaudit "<TR>"

ac $winaudit "<TD style='border:1px solid black' align=left rowspan=$count>"
ac $winaudit "<p><font color='#196aa5'>$Name</font></p>"    
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$DsnType</font></p>"
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Platform</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$DriverName</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Description</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Server</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Trusted_Connection</font></p>"
ac $winaudit "</TD>"

ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Database</font></p>"
ac $winaudit "</TD>"

#end of row
ac $winaudit "</TR>"

#Ending & fixing the position of the table
ac $winaudit "</TD></TR></table>"
ac $winaudit "</table><P>"
ac $winaudit "<br><br>"

}

if ((get-odbcdsn) -eq $null) {
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b><i>Section 4 : No ODBC<i></b></p></font></td></tr></table>'
ac $winaudit "<br><br>"
}


############################
#Section 
Write-Host "Checking : SQL"
$instance = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL').((get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances)

if ($instance -ne $null) {
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>Section : SQL</b></p></font></td></tr></table>'
#main table
ac $winaudit '<table style="border:1px solid black" width="100%" bgcolor="#e1e1e1" cellspacing="0" cellpadding="0"<TR><TD>'
#subtable
ac $winaudit '<table border="1px" width="100%" bgcolor="white" cellspacing="0" cellpadding="0">'
#colors from http://www.color-hex.com/
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Computer</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Edition</font></th>'
ac $winaudit '<th style="border:1px solid black"><font face="Century Gothic,Verdana,Tahoma" color="black">Version</font></th>'

$Computer = $env:computername
$Edition  = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\$instance\Setup").Edition
$Version  = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\$instance\Setup").Version

write-host "collecting information about SQL in $netbios" -foregroundcolor green

#start of a new row
ac $winaudit "<TR>"

ac $winaudit "<TD style='border:1px solid black' align=left>"
ac $winaudit "<p><font color='#196aa5'>$Computer</font></p>"    
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Edition</font></p>"
ac $winaudit "</TD>"                                        
                                                            
ac $winaudit "<TD style='border:1px solid black' align=left >"
ac $winaudit "<p><font color='#196aa5'>$Version</font></p>"
ac $winaudit "</TD>"

#end of row
ac $winaudit "</TR>"

#Ending & fixing the position of the table
ac $winaudit "</TD></TR></table>"
ac $winaudit "</table><P>"
ac $winaudit "<br><br>"
}

if ($instance -EQ $null) {
ac $winaudit '<table style="border:1px solid black" width=100% bgcolor="#00518c" cellspacing="0" cellpadding="0"><tr><td><font face="Bookman,Palatino,Century Gothic,Verdana,Tahoma" size="3" color="white"><p><b>No SQL Database found</b></p></font></td></tr></table>'
ac $winaudit "<br><br>"
}

#open the report
ii $winaudit
