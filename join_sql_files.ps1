# join_sql_files.ps1

param (
    [string]$sqlFolderPath,
    [string]$outputFolderPath,
    [string]$outputFileName
)

# Get all .sql files in the folder
$sqlFiles = Get-ChildItem -Path $sqlFolderPath -Filter *.sql

# Initialize an empty string to store the concatenated content
$concatenatedContent = ""

# Loop through each .sql file and concatenate its content
foreach ($sqlFile in $sqlFiles) {
    $fileContent = Get-Content -Path $sqlFile.FullName -Raw
    $concatenatedContent += $fileContent
    $concatenatedContent += "`r`nGO`r`n"  # Add "GO" between scripts for separation
}

# Save the concatenated content to the output file
$concatenatedContent | Set-Content -Path "$outputFolderPath\$outputFileName"

Write-Output "SQL files joined into $outputFolderPath\$outputFileName."
