param (
    [string]$sqlFolderPath
)

$sqlFiles = Get-ChildItem -Path $sqlFolderPath -Filter *.sql
if ($sqlFiles.Count -gt 0) {
  Write-Output "SQL files exist in the $sqlFolderPath folder. Proceeding with deployment."
  echo "deploy=true" >> $GITHUB_ENV
} else {
  Write-Output "No SQL files found in the $sqlFolderPaths folder. Skipping deployment."
  echo "deploy=false" >> $GITHUB_ENV
}
