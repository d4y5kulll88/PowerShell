<#
.SYNOPSIS
    This Function generates a specified number of random integers within a given range.
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Invoke-RandomNumbers {
    [CmdletBinding()]
    param (
        [int] $Count,
        [int] $MinValue,
        [int] $MaxValue
    )
    
    begin {
        Write-Output "`nGenerating Random Numbers."
    }
    
    process {
        for ($i = 0; $i -lt $count; $i++) {
            Get-Random -Minimum $minValue -Maximum $maxValue
        }
    }
    
    end {
        Write-Output "End Block.`n"
    }
}


<#
.SYNOPSIS
    This Function retrieves a list of files in a specified directory.
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Get-FileList {
    [CmdletBinding()]
    param (
        [string] $Path
    )
    
    begin {
        Write-Output "`nGetting Files"
    }
    
    process {
        Get-ChildItem -Path $path
    }
    
    end {
        Write-Output "End Block.`n"
    }
}


<#
.SYNOPSIS
    This Function converts file sizes from bytes to kilobytes.
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Convert-FileSize {
    [CmdletBinding()]
    param (
        [long] $SizeInBytes
    )
    
    begin {
        Write-Output "`nCoverting File size from bytes to kilobytes."
    }
    
    process {
        Write-Output "File Size is $([System.Math]::Round($SizeInBytes/1KB, 2)) KBs."
        Write-Output "File Size is $([System.Math]::Round($SizeInBytes/1MB, 2)) MBs."
        Write-Output "File Size is $([System.Math]::Round($SizeInBytes/1GB, 2)) GBs."
        Write-Output "File Size is $([System.Math]::Round($SizeInBytes/1TB, 2)) TBs."
    }
    
    end {
        Write-Output "End Block.`n"
    }
}


<#
.SYNOPSIS
    This Function retrieves information about running processes.
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

function Get-UserInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=1)]

        # Restricts the parameter value to a predefined set of values.
        [ValidateSet("Mr.", "Mrs.", "Ms.", "Dr.")]
        [String] $Title,


        # Parameter Attribute:
        # This attribute is used to specify the behavior of the parameter.
        [Parameter(
            # Indicates that the parameter is required. The user must provide a value.
            Mandatory=$true,

            # Specifies the position of the parameter.
            # In this case, Position=2 indicates that this parameter is the Second one in the parameter list.
            Position=2,

            # Specifies the name of the parameter set to which this parameter belongs.
            # Parameter sets allow you to define different combinations of parameters.
            ParameterSetName="ParameterSetName",

            # Indicates that the parameter does not accept input from the pipeline.
            ValueFromPipeline=$false,

            # Allows the parameter to accept values from pipeline objects that have a property with the same name (FirstName in this case).
            ValueFromPipelineByPropertyName=$false,

            # Provides a help message that describes what the parameter is for. This is useful for providing context to users.
            HelpMessage="First Name of the User")]
        
        # This attribute defines an alias for the parameter.
        # In this case, I can use either $FirstName or $FName to refer to the same parameter.
        [Alias("FName")]

        # This attribute enforces that the value provided for $FirstName is not null or empty.
        # It ensures that the user must provide a non-empty string.
        [ValidateNotNullOrEmpty()]
        [string] $FirstName,


        [Parameter(
            Mandatory=$true,
            Position=3,
            ParameterSetName="ParameterSetName",
            ValueFromPipeline=$false,
            ValueFromPipelineByPropertyName=$false,
            HelpMessage="First Name of the User")]
        [Alias("LName")]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string] $LastName,


        [Parameter(Mandatory)]
        [ValidateRange(18, 120)]
        [int] $Age,

    
        [Parameter(Mandatory)]

        # Validates the parameter value against a regular expression pattern.
        [ValidatePattern("^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")]
        [string] $Email
    )
    
    begin {
        Write-Output "`nUser Information"
    }
    
    process {
        Write-Output "Full Name: $Title $FirstName $LastName"
        Write-Output "Age: $Age"
        Write-Output "Email: $Email"
    }
    
    end {
        Write-Output "End Block`n"
    }
}



# Invoking the function
Invoke-RandomNumbers -Count 5 -MinValue 1 -MaxValue 100

# Get-FileList -Path "C:\windows"

# Convert-FileSize -SizeInBytes 40962398498237

# Get-UserInfo -Title "Dr." -FName "Adam" -LastName "Warlock" -Age 45 -Email "Adam@warlock.com"