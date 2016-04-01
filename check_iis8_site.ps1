<#
Ester Niclos Ferreras

Checks IIS Site state

OK - started
CRITICAL - STOPPED
UNKNOWN - not found


#>


#
# Shell arguments
#
[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
   [string]$website
   )

Set-Variable OK 0 -option Constant
Set-Variable WARNING 1 -option Constant
Set-Variable CRITICAL 2 -option Constant
Set-Variable UNKNOWN 3 -option Constant


#
# ASK STATUS
#
#Load assembly
[System.Reflection.Assembly]::LoadFrom( "C:\windows\system32\inetsrv\Microsoft.Web.Administration.dll" )  >  $null



$servermanager = [Microsoft.Web.Administration.ServerManager]::OpenRemote("localhost")

$site= $servermanager.Sites["$website"]

$iis=get-itemproperty HKLM:\SOFTWARE\Microsoft\InetStp\  | select setupstring

# Nagios output

$resultstring="IISSITE UNKNOWN  $website not found"
$exit_code = $UNKNOWN
  
if ($site -ne $null) {
      
  $status= $site.State
  
  if ($status -eq "Started"){
    $resultstring='IISSITE OK ' + $website + ' ' + $status + '-' + $iis.setupstring
	$exit_code = $OK
  }
  elseif ($status -eq $null) {
	$resultstring="IISSITE UNKNOWN  $website exists, but has no state. Check it is not a FTP site."
  }
  else
  {	
	$resultstring='IISSITE CRITICAL '+ $website + ' ' + $status + '-' + $iis.setupstring
	$exit_code = $CRITICAL
  }
  
}




Write-Host $resultstring
exit $exit_code

