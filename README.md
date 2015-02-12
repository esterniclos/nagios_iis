# nagios_iis
Checks for nagios iis v8

Requirements:

- Powershell
- Internet Information Server
 
Working with NSCLient++

Drop the checks into C:\Program Files\NSClient++\scripts

Write a wrapper function in ncslient.ini

[/settings/external scripts/scripts]
check_iis8_app_pool_state = C:\Program Files\NSClient++\scripts\check_iis8_app_pool_state.ps1 $ARG1$
