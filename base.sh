#!/bin/bash

#This is a rough first draft, but I'm sure you'll get the idea.
# - Lord bin 2020, to dad-bin, did it.

#move to Programs folder on home dir
echo "welcome to the appimage installer v0.0.1, please select file"
read -p 'filename (include extension): ' file
if [[ $file == *.AppImage ]]
then
  mkdir -p ~/Programs/$file
  mv $file ~/Programs/$file
  echo done
elif [[ $file != *.AppImage ]]; then
  echo "$file not an appimage "
fi

#.desktop setup
cp template.desktop $file.desktop

# .desktop editor
sed -i "s+~/Programs/*+~/Programs/$file/$file+g" $file.desktop

#now the icon, use jpg

sed -i "s+~/Programs/*/Icon+~/Programs/$file/icon.jpg+g" $file.desktop

mv $file.desktop ~/Programs/$file
