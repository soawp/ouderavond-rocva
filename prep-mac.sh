#! /bin/bash
# Maak deze script uitvoerbaar door het gebruik van "chmod +x prep-mac.sh"
# En door vervolgens "./prep-mac.sh" te gebruiken.
clear

echo "Voorbereiden..."
echo "================================================"

rm ./prepare.log 2>/dev/null   # clean up before we start.
git fetch --all                # and make sure the local repo
git reset --hard origin/master # is ready and up to date.
git clean -f -d
mkdir ./.vscode/ext

echo ""
echo "Installeren van extensies..."
echo "================================================"

install_ext() {
	echo "Installeren van extensie '$1'..."
	code -r --install-extension "$1" --force --extensions-dir "./.vscode/ext" >>./prepare.log
}

while read line; do
	install_ext "${line}"
done <./.vscode/extensions.txt

echo ""
echo "Alles is voltooid."
code . --user-data-dir "./.vscode/" --extensions-dir "./.vscode/ext" "./opdracht/index.html" "./opdracht/style.css"
