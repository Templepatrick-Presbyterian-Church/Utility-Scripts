<#
 SCRIPT INFO
 ----------------------------
 Batch File for converting the recorded livestream into an mp3 file

 utlises FFMPEG for the heavy lifting, and uses a special version called ffmpeg-bar that
 requires node.js and that package to be installed globally

 This script should be placed in the Videos folder
 
 v1.3.0
 Original Creation Date: 03/10/2021
 by Jamie Wright for Templepatrick Presbyterian Church
 Contact: jwright3478@gmail.com [if you are emailing me about
 this, please use "TPC - Post-service mp3 Script" somewhere
 in the subject line]

 Changelog:
 *NOTICE* As of 27/08/23, the changelog has been moved to the git log as this script has been uploaded to GitHub
 v1.3.0 - 16/07/23
 - Remove auto-delete functionality
 - Some debug messaging about moving
 - Move video and audio to their respective folders
 v1.2.1 - 03/07/22
 - Auto copy to the memory pen
 v1.2 - 26/06/2022
 - Add autoset date functionality
 - remove the video after conversion
 - add support for mkv

 Contributers:
 [Hey, you reading this! If you make a change to
 this file make sure you upload it to GitHub and 
 your attributed correctly, so that you can be 
 contacted if something goes wrong!]
#>

# Show warning to the user so that they don't delete the original file by mistake
# Get today's date (this will be used to read in the video file as well as writing out the sound file)
$date = (python -c "from datetime import datetime; print(datetime.today().strftime('%d %B %Y'))")

# Begin the conversion process
echo "Conversion Progress:"
ffmpeg-bar -i "$date.mkv" "$date.mp3"

# remove the source, copy the mp3 to memory pen and move the 
# audio to the recording folder
echo "Copying mp3..."
copy "$date.mp3" "C:\Users\%USERNAME%\Dropbox\Church\MP3 Recordings"
echo "Moving files to archives..."
move "$date.mkv" "Recordings\Video\$date.mkv"
move "$date.mp3" "Recordings\Audio\$date.mp3"

# Display final message
echo ""
echo "Done! File has been copied to the memory pen if it's currently inserted, the original video file and the created mp3 has been moved to the Recordings folder."
echo ""

# give the user a chance to review what just happened
pause
