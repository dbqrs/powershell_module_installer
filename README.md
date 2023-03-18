## Install-Modules.ps1

This is for installing and/or upgrading multiple PowerShell modules with one script. I added the top 100 most downloaded packages from [PowerShell Gallery](https://www.powershellgallery.com/stats/packages) as of March 18, 2023. Delete or add the packages you require. You may install all of them, although it is not recommeded. Only install what you will use or need.

The **LogPath** parameter is set to a default value of $env:TEMP\Install-Modules.log. If you do not specify a value for the LogPath parameter, the log file will be created at the default location.

To specify a custom log location, you can run the script with the **-LogPath** parameter and specify the path where you want the log file to be created. For example, to install the modules and create the log file at **C:\Logs\Install-Modules.log**, you can run the following command:

**.\Install-Modules.ps1 -LogPath "C:\Logs\Install-Modules.log"**

  
## Download and Use
[Download](https://github.com/dbqrs/powershell_module_installer/archive/refs/heads/main.zip) 

You should already understand how to run the script. Just in case you dont, open PowerShell as an Administrator, change to the directory the script is located in and run this command **.\Install-Modules.ps1**
