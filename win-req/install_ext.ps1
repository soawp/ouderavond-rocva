Clear-Host

Write-Output "Voorbereiden..."
Write-Output "================================================"

git fetch --all 
git reset --hard origin/master
git clean -f -d


Write-Output ""
Write-Output "Installeren van extensies..."
Write-Output "================================================"

foreach ($line in [System.IO.File]::ReadLines("./.vscode/extensions.txt")) {
	Write-Output "Installeren van extensie '$line'..."
	code -r --install-extension $line --force --extensions-dir "./.vscode/ext"
}

Write-Output ""
Write-Output "Alles is voltooid."

code . --user-data-dir "./.vscode/udata" --extensions-dir "./.vscode/ext" "./opdracht/index.html" "./opdracht/style.css"
