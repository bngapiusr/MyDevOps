﻿configuration Install-WebServer
{
param([string[]]$ComputerName = $env:COMPUTERNAME)
    # One can evaluate expressions to get the node list
    # E.g: $AllNodes.Where("Role -eq Web").NodeName
    #Sample comment
    node $ComputerName
    {
        # Call Resource Provider
        # E.g: WindowsFeature, File
        WindowsFeature IIS
        {
           Ensure = "Present"
           Name   = "Web-Server"
        }

        WindowsFeature ASP
        {
           Ensure = "Present"
           Name   = "Web-Asp-Net45"
        }
        
        WindowsFeature ADPS
        {
           Ensure = "Present"
           Name   = "RSAT-AD-PowerShell"
        }   
    }
}