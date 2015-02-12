# nagios_iis
Checks for nagios iis v8

Requirements:

- Powershell
- Internet Information Server
 
Working with NSCLient++

Drop the checks into C:\Program Files\NSClient++\scripts

Write a wrapper function in ncslient.ini

    [/settings/external scripts/scripts]
         # Requires allow arguments=true
          check_iis8_app_pool_state = powershell.exe scripts\check_iis8_app_pool_state.ps1 $ARG1$
          
          check_default_app_pool = powershell.exe scripts\check_iis8_app_pool_state.ps1 DefaultAppPool


To test your command in nsclient, use 

          C:\Program Files\NSClient++\nscp.exe test
