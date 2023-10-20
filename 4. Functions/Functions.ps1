# ---------------------------------#
# Anatomy of a PowerShell Function #
# ---------------------------------#
# function help - (optional but strongly recommended)
# function name
# CmdletBinding - (optional)
# Parameters - (optional)
# Function logic (optional Begin / Process / End)
# return - (optional)

###########################################################################################################

<#
.SYNOPSIS
    Print something on the terminal
.DESCRIPTION
    This function outputs the specified string on the terminal
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Write-Something -name "Tom Sawyer" -age 29 -employeed $true -worth 23.78
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Write-Something {

    # This is a Basic Function
    param (
        [string] $name,
        [int] $age,
        [bool] $employeed,
        [double] $worth
    )

    Write-Host "My name is $name. I am $age years old." -ForegroundColor Cyan

    if($employeed -ne $true){
        Write-Host "Am i employeed ? No, I am not. But still my networth is `$ $worth billion" -ForegroundColor Cyan
    }
    else {
        Write-Host "Am i employeed ? Yes, that's $employeed. And my networth is `$ $worth billion" -ForegroundColor Cyan
    }
}

Write-Something -name "Tom Sawyer" -age 29 -employeed $false -worth 23.78

###########################################################################################################

<#
.SYNOPSIS
    Creates Configuration files.
.DESCRIPTION
    Returns the configuration files with the specified username along with the version information.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Set-Configuration -name "Arthur Shelby"
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Set-Configuration {

    # This is an advanced Function
    # CmdletBinding turn a basic function into an Advanced Function

    [CmdletBinding()]
    param (

        # Name parameter is mandatory
        [Parameter(Mandatory)]
        [string] $name,


        [Parameter()]
        # Only these specific values are allowed
        [ValidateSet("12.0.1.456 RC1", "12.0.1.456 RC2", "12.0.1.456 RC3")]
        # Default Parameter Value is set
        [string] $version = "1.0.91 RC1",


        # Default Parameter Value is set
        [Parameter(ValueFromPipeline)] 
        [int] $stat
    )

    begin {
        Write-Verbose "Execution Started..."
        Write-Host "Creating config files for $name for version $version" -ForegroundColor Red
    }

    process {
        Write-Host "Return status $stat" -ForegroundColor Cyan
    }

    end {
        Write-Host "Deleting config files for $name for version $version" -ForegroundColor Red
        Write-Verbose "Execution completed...`n`n"
    }
}
$stat = @(0, 1, 2, 3, 4)

 $stat | Set-Configuration -name "Peter Parker" -version '12.0.1.456 RC2' -Verbose

###########################################################################################################

<#
.SYNOPSIS
    Display the Public IP of your system.
.DESCRIPTION
    This Program fetches & displays your Public IP on the terminal.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    No Link
.EXAMPLE
    Get-PublicIP
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
.EXAMPLE
    Get-PublicIP -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Get-PublicIP {

    [CmdletBinding()]
    param (
    )

    $uri = "https://api.ipify.org"

    Write-Verbose "Fetching Public IP from $uri"

    try {
        $invokeRestMethodSplat = @{
            uri = $uri
            ErrorAction = "Stop"
    }

        $publicIP = Invoke-RestMethod @invokeRestMethodSplat
    }
    catch {
        Write-Error $_ -ErrorAction Stop
    }

    return $publicIP
}

# Using Return value from a function directly into output
Write-Host "Your Public IP: $(Get-PublicIP -Verbose)" -ForegroundColor Cyan

###########################################################################################################

