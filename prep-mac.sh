#! /bin/bash 
# Maak deze script uitvoerbaar door het gebruik van "chmod +x prep-mac.sh"
# En door vervolgens "./prep-mac.sh" te gebruiken.

rm ./prepare.log                # clean up before we start.
git fetch --all                 # and make sure the local repo
git reset --hard origin/master  # is ready and up to date.
git clean -n -f -d
git pull --force

install_ext () {
	echo "Installeren van extensie '$1'..."
	code -r --install-extension "$1" --force >> ./prepare.log
}

while read line; do
	install_ext "${line}"
done < ./.vscode/extensions.txt