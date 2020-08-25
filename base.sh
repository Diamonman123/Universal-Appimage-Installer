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
sed -i "s+~/Programs/+~/Programs/$file/$file+g" $file.desktop

#now the icon, use jpg or png
read -p "[jpg / png]" icon

if [[ $icon == "jpg" ]]; then
  mv Icon.jpg ~/Programs/$file/
  sed -i "s+~/Icon+~/Programs/$file/Icon.jpg/+g" $file.desktop
elif [[ $icon == "png" ]]; then
  mv Icon.png ~/Programs/$file/
  sed -i "s+~/Icon+~/Programs/$file/Icon.png/+g" $file.desktop
fi

#now the app name
sed -i "s+Name of Application+$file+g" $file.desktop

#moving .desktop files
sudo cp $file.desktop /usr/share/applications
mv $file.desktop ~/Programs/$file

echo "Done, now exiting"
exit
