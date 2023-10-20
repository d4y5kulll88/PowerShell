# For Loop

for($i = 0; $i -lt 5; $i++) {
    Write-Warning("Max Temperature reached = $i") 
}

Write-Output "`r`n####################################################################################`r`n"

$array = @("Aventador", "Bugatti", "Camero", "Duster", "Elise", "Ford")

for($i = 0; $i -lt $array.Count; $i++) {
    Write-Host $array[$i]
}

Write-Output "`r`n####################################################################################`r`n"

$ls = Get-ChildItem 'C:\Users'
$ls

Write-Output "`r`n####################################################################################`r`n"

[string]$a = "Tom Marvalo Riddle"

[string]$rev = ''

for ($i = $a.Length; $i -ge 0; $i--) {
    $rev += $a[$i]
}

Write-Output "`r`n"
Write-Host "The reversed String is `"$rev`"."

Write-Output "`r`n####################################################################################`r`n"


# While Loop

$i = 10
while($i -ne 0)
{
    Write-Host("                  ") -BackgroundColor $i
    $i--
}

Write-Output "`r`n####################################################################################`r`n"


# Do While Loop

do
{
    Write-output("This is a Do While loop.")
    Write-output("This do While loop will execute at least once, which is what it did right now:)")
}
while($false)

Write-Output "`r`n####################################################################################`r`n"

# For Each Loop

# Ping to multiple Hosts

foreach($i in ('localhost', 'google.com', 'youtube.com', 'capgemini.com')) {Test-Connection $i | Format-Table}


$array = @("Aventador", "Bugatti", "Camero", "Duster", "Elise", "Ford")

foreach($name in $array)
{
    Write-Host($name) -ForegroundColor $name.Length -BackgroundColor $name.Length
}

Write-Output "`r`n####################################################################################`r`n"

$path = 'C:\Users\mukeshls\Videos'
$files = Get-ChildItem $path -Recurse
[double]$totalSize = 0

foreach($item in $files)
{
    $totalSize += $item.Length
}

# Converting bytes into MB, GB
Write-Host "The Total Size of the files in $path directory is $($totalSize /1GB) GB." -ForegroundColor Green

Write-Output "`r`n####################################################################################`r`n"

# Get the Processes which is using memory greater than 400 MB
$largeProcesses = Get-Process | Where-Object {$_.WorkingSet64 -gt 300MB} | Format-Table

$largeProcesses

Write-Output "`r`n####################################################################################`r`n"

# Get the files & folder count & total size of the files.
$fileCount = 0
$folderCount = 0
$fileSize = 0

$path = "C:\Users\mukeshls"

$getItems = Get-ChildItem -Path $path -Recurse -Depth 2

foreach($item in $getItems){
    if($item.PSIsContainer){
        # This is a Folder
        $folderCount += 1
    }
    else {
        # This is a file
        $fileCount += 1
        $fileSize += $item.Length
    }
}

Write-Host "The number of directories are $folderCount" -ForegroundColor Cyan
Write-Host "The number of files are  $fileCount" -ForegroundColor Red
Write-Host "The Total Size of the files are  $($fileSize /1MB) MB" -ForegroundColor Green