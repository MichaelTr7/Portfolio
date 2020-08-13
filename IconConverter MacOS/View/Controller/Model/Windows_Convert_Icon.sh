
path="$1"
echo "$path"
cd "$path"


ffmpeg -i App_Icon_Image.png -s 256x256 App_Icon_Image_Resized.png
ffmpeg -i App_Icon_Image_Resized.png Windows_Icon.ico
