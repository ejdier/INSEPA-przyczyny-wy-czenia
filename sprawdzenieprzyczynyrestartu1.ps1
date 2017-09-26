[CmdletBinding()] 
Param ( 
	[Parameter(Mandatory=$True)] 
	[string]$name 
 
)

    cd "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client"
    ./vpnui.exe
    Invoke-Command -ComputerName $name -Credential insepa\ -ScriptBlock {get-eventlog -logname system |
        ?{$_.eventid -eq "1074"} |  select -first 3 |
              Format-table -wrap
              }