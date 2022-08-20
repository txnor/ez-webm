#/bin/bash
clear
echo "Checking FFMPEG.."
if ! ffmpeg -f concat > /dev/null 2>&1 &
then
echo "Looks like you dont have FFMPEG package installed."
echo "Installing FFMPEG.."
echo "Dont close this until we finish."
echo "FFMPRG has been installed."
pkg install ffmpeg > /dev/null 2>&1 &
else
echo "FFMPEG is already installed."
fi
sleep 1
echo "Loading.."
sleep 0.1
echo "####### ####### #     # ####### ######  #     #
#            #  #  #  # #      #     # ##   ##
#           #   #  #  # #       #     # # # # #
#####      #    #  #  # #####   ######  #  #  #
#         #     #  #  # #       #     # #     #
#        #      #  #  # #       #     # #     #
####### #######  ## ##  ####### ######  #     # "
echo "Version : 0.0.1"
echo "Creator : 1.#8503"
echo "Any issue with the tool, you would need to dm the creator."
sleep 0.1
read -p "Insert your video name: " video
read -p "Insert the 2nd video name(The part to disappear): " videotwo
read -p "Rename video to: " newname

echo "File is being renamed to: '$newname'"
sleep 0.5
echo "Please wait until ffmpeg does all the job."
echo "This might take a while...."

ffmpeg -i $video.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus part1.webm &>/dev/null
ffmpeg -i $videotwo.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus part2.webm &>/dev/null
ffmpeg -i part2.webm -vf scale="9998:2" part3.webm &>/dev/null

echo "
file part1.webm 
file part3.webm
" > finishing.txt
ffmpeg -f concat -safe 0 -i finishing.txt -map 0 -c copy $newname.webm
clear

if [[ ! -f "$video" ]] 
then
echo "ERROR : FILE DOESNT EXIST."
echo "
░█▀▀█ ░█▀▀█ ░█▀▀▀ ░█▀▀▄ ▀█▀ ▀▀█▀▀ ░█▀▀▀█ 
░█─── ░█▄▄▀ ░█▀▀▀ ░█─░█ ░█─ ─░█── ─▀▀▀▄▄ 
░█▄▄█ ░█─░█ ░█▄▄▄ ░█▄▄▀ ▄█▄ ─░█── ░█▄▄▄█
"
echo "CleitinDoGrau#3792"
echo "1.#8503"
echo "Looks like the script didnt work, are you sure the video  specified exist or is in the same directory as ezwebm?"
rm finishing.txt
else
echo "Your file has been saved as '$newname'.webm"
echo "                                               ░█▀▀█ ░█▀▀█ ░█▀▀▀ ░█▀▀▄ ▀█▀ ▀▀█▀▀ ░█▀▀▀█             ░█─── ░█▄▄▀ ░█▀▀▀ ░█─░█ ░█─ ─░█── ─▀▀▀▄▄             ░█▄▄█ ░█─░█ ░█▄▄▄ ░█▄▄▀ ▄█▄ ─░█── ░█▄▄▄█            
"                                                    echo "CleitinDoGrau#3792"                            echo "1.#8503"                                       echo "You can close this."
rm finishing.txt                                     rm part1.webm
rm part2.webm
rm part3.webm
fi
