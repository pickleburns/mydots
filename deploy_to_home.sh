#!/bin/sh
set -e
#This sets up a home tmp directory and symlinks all of the dotfiles into place.
HDIR="$HOME"
SOURCEDIR="$( pwd )"

printf "creating links in: $HDIR\n"
printf "sourcing files from: $SOURCEDIR\n"
echo "-----------------------------------\n"

printf "Checking for $HDIR/.tmp ...\n"
if [[ ! -e $HDIR/.tmp ]]; then
  printf "Creating $HDIR/.tmp\n\n"
  mkdir "$HDIR/.tmp"
else
  printf "Found .tmp\n\n"
fi

find . -regex '\.\/\.[^git].*' -maxdepth 1 | while read file; do
  echo "${file:2} to $HDIR/${file:2}"
  if [ -e "$HDIR/${file:2}" ]; then
    printf >&2 "WARNING:: ${file:2} exists, refusing to clobber it.\n\n"
  else
    ln -s "$SOURCEDIR/${file:2}" "$HDIR/${file:2}"
  fi
done
