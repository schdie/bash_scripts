#!/bin/bash
# inspired by: https://gist.github.com/Linux4/243e4aab83867e2b3f4322c2a0eb5a3e
# req: bash, unzip, sed, heimdall, lz4, tar

# file selection
if [[ $1 == *.zip ]] && [ -f "$1" ]; then
	# decompress main firmware zip
	echo -e "\033[1mUnpacking main firmware...\033[0m"
	unzip $1
else
	echo -e "\033[1mUsage:\033[0m heimdall.sh filename.zip"
	exit
fi

# hidden option, use -w to force wipe data
if [ "$2" ] && [ "$2" == "-w" ]; then
	CSC="CSC"
	echo -e "\n\033[1mFirwmare should wipe data.\033[0m"
else
	CSC="HOME"
	echo -e "\n\033[1mFirwmare should not wipe data.\033[0m"
fi

# extract pit file from CSC tar
echo -e "\n\033[1mExtracting pit file...\033[0m"
tar --wildcards --exclude='*/*' -xvf CSC*.md5 '*.pit'

# decompress the main tar files
for PART in BL AP CP "$CSC"; do
	echo -e "\n\033[1mUnpacking $PART...\033[0m"
	tar --wildcards --exclude='*/*' -xvf "${PART}"*.md5 '*.lz4'
	rm "${PART}"*.md5
done

# remove the unused CSC folder
if [ "$CSC" == "HOME" ]; then
	rm CSC*.md5
else
	rm HOME*.md5
fi

# unpack lz4
echo -e "\n\033[1mLZ4 Decoding...\033[0m"
for LZ4 in *.lz4; do
	unlz4 "$LZ4"
	rm -f "$LZ4"
done

# generate heimdall flash command
echo -e "\n\033[1mFlashing command:\n\033[0m"
echo -e "heimdall flash "$(heimdall print-pit --file *.pit | grep -e "Partition Name" -e "Flash Filename" | sed -e '1~2s/.*: /--/' -e '2~2s/.*: //' | sed '$!N;/--.*\n$/d;P;D' | tr -s '\n' ' ')
printf "\n"
