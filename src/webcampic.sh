timestamp=$(date +"%Y%m%d_%H%M%S")
filename="pic_${timestamp}.jpg"

ffmpeg -f v4l2 -i /dev/video0 -vf "drawtext=text='%{localtime}':fontsize=32:fontcolor=orange:x=(w-tw-10):y=(h-th-10)" -vframes 1 "${filename}"

