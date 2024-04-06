#!/bin/bash
# flac to mp3 v0
# flac folders must contain [FLAC WHATEVER] in its names and should not in its subdirectories
# the converted folders will get a [v0] instead of [FLAC WHATEVER] and will be placed in the parent flac folder
# subdirectories are taken into account, ex: mycd[flac]/disk1, mycd[flac]/disk2 and dealt accordingly
# comment the last line to avoid moving the converted [v0] folders
# flexible enough to adapt to your needs

# parent FLAC folder
FLACFOLDER="/home/user/my_flacs_folder/"
# output dir
MP3FOLDER="/home/user/my_mp3s_folder/"

# ffmpeg codec paramenters
FFMPEGPARAMV0=" -codec:a libmp3lame -q:a 0 -map_metadata 0 -id3v2_version 3 -write_id3v1 1 "
NEWTAGFOLDER="v0"

# fun testing
#find "$FLACFOLDER" -iname '*.flac' -exec bash -c 'D=$(dirname "{}"); B=$(basename "{}"); E="${D%/*}" && F="${E##*/}"; output_dir=$(echo "$F" | sed -e "s/\[.*\]/\['"$NEWTAGFOLDER"'\]/g"); mkdir -p "$output_dir"; ffmpeg -i "{}" -codec:a libmp3lame -q:a 0 -map_metadata 0 -id3v2_version 3 -write_id3v1 1 "$output_dir/${B%.*}.mp3"' \;

# convert all the [flac] folders to [v0] in place
find "$FLACFOLDER" -iname '*.flac' -exec bash -c 'D=$(dirname "{}"); B=$(basename "{}"); output_dir=$(echo "$D" | sed -e "s/\[.*\]/\['"$NEWTAGFOLDER"'\]/g"); mkdir -p "$output_dir"; ffmpeg -i "{}$FFMPEGPARAMV0" "$output_dir/${B%.*}.mp3"' \;

# move the [v0] folders, remove the "-i" if you don't want it to be interactive
mv -i "$FLACFOLDER"*\[v0\]*/ "$MP3FOLDER"
