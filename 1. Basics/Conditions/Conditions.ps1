# Conditional Statement

$filepath = "C:\Windows\win.ini"

if(Test-Path -Path $filepath)
{
    $data = Get-Content -Path $filepath

    if($data.Count -eq 0)
    {
        Write-Output "File is empty"
    }
    elseif($data.Count -ge 1000)
    {
        Write-Output "The file is larger amount of data"
    }
    else
    {
        $data
    }
}
else
{
    Write-Information "Filepath $filepath does not exists"
}

# Switch Statement

# Days of the week
[int]$day = Read-Host -Prompt "Enter a number"

Switch($day)
{
    1 { Write-Output "Today is Monday"}
    2 { Write-Output "Today is Tuesday"}
    3 { Write-Output "Today is Wednesday"}
    4 { Write-Output "Today is Thursday"}
    5 { Write-Output "Today is Friday"}
    6 { Write-Output "Today is Saturday"}
    7 { Write-Output "Today is Sunday"}
    
    default{ Write-Output "Please enter a number between 1 to 7" }
}
