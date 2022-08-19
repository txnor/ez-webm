#/bin/bash
clear
echo "Checking FFMPEG.."
echo "Checking NANO.."
echo "Loading.."
echo "####### ####### #     # ####### ######  #     #
#            #  #  #  # #       #     # ##   ##
#           #   #  #  # #       #     # # # # #
#####      #    #  #  # #####   ######  #  #  #
#         #     #  #  # #       #     # #     #
#        #      #  #  # #       #     # #     #
####### #######  ## ##  ####### ######  #     # "
echo "Version : 0.0.1"
echo "Creator : 1.#8503"
echo "Any issue with the tool, you would need to dm the creator."

read -p "Insert your video name: " video
read -p "Insert the 2nd video(The part to disappear): " videotwo
read -p "Rename video to: " newname

echo "File is being renamed to: '$newname'"
echo "Please wait until ffmpeg does all the job."

ffmpeg -i $video.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus part1.webm
ffmpeg -i $videotwo.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus part2.webm
ffmpeg -i part2.webm -vf scale="9998:2" part3.webm

echo "
file part1.webm 
file part3.webm
" > finishing.txt
ffmpeg -f concat -safe 0 -i finishing.txt -map 0 -c copy $newname.webm
echo "Success!"
echo "
░█▀▀█ ░█▀▀█ ░█▀▀▀ ░█▀▀▄ ▀█▀ ▀▀█▀▀ ░█▀▀▀█ 
░█─── ░█▄▄▀ ░█▀▀▀ ░█─░█ ░█─ ─░█── ─▀▀▀▄▄ 
░█▄▄█ ░█─░█ ░█▄▄▄ ░█▄▄▀ ▄█▄ ─░█── ░█▄▄▄█
"
echo "CleitinDoGrau#3792"
echo "1.#8503"
echo "You can now close this."
rm finishing.txt
rm part1.webm
rm part2.webm
rm part3.webm
