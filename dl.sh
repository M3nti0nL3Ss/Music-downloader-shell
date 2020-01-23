#!/bin/bash

##9lt-maydar-katnfe3

clear
echo "-------By-M3nti0nL3Ss-------"
echo "Enter youtube urls: "
x="N"
touch dl
while [[ $x = "n" ]] || [[ $x = "N" ]] ; do
read -p "Enter URL ${i}: " url
echo $url >> dl
i=`expr $i + 1`
read -p "Done ? (y/n)" x
done

echo "Downloading..."

for i in `cat dl` ; do
youtube-dl -f 'bestaudio[ext=m4a]' $i
done

echo "Converting..."

for f in *.m4a; do
ffmpeg -i "$f" -codec:v copy -codec:a libmp3lame -q:a 2 "${f%.m4a}.mp3";
done

if [ $? -eq 0 ]; then
rm -f *.m4a
fi

rm -f dl

echo "Done :D"
