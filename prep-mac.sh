#! /bin/bash
# Maak deze script uitvoerbaar door het gebruik van "chmod +x prep-mac.sh"
# En door vervolgens "./prep-mac.sh" te gebruiken.
clear

echo "Voorbereiden..."
echo "================================================"

rm ./prepare.log 2>/dev/null	# clean up before we start.
git fetch --all 				# and make sure the local repo
git clean -f -d                	# is ready and up to date.
git reset --hard origin/master	

echo ""
echo "Installeren van extensies..."
echo "================================================"

while read line; do
	echo "Installeren van extensie '${line}'..."
	code -r --install-extension "${line}" --force --extensions-dir "./.vscode/ext" >>./prepare.log
done <./.vscode/extensions.txt

echo ""
echo "Alles is voltooid."
code . --user-data-dir "./.vscode/udata/" --extensions-dir "./.vscode/ext" "./opdracht/index.html" "./opdracht/style.css"
