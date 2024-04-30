function ffmpeg-longedge {  
  ffmpeg -i "$1" -ss 00:00:${3:-00} -t 3 -vf scale=-1:512 -vf fps=fps=30 -r 30 -c:v libvpx-vp9 -crf ${2:-32} -an "${1%.*}-512-long-edge-crf${2:-32}.webm"
  echo $1 $2 $3
  success='y'
  vared -p "Did the conversion complete successfully? (y/n) " -c success
  if [ "$success" = "y" ]; then
    mv "${1%.*}-512-long-edge-crf${2:-32}.webm" ../3-completed/
    rm "$1"
  fi
}

function ffmpeg-512 {
  ffmpeg -i "$1" -ss 00:00:${3:-00} -t 3 -filter:v "crop=min(iw\,ih):min(iw\,ih),scale=512:512,fps=fps=30" -r 30 -c:v libvpx-vp9 -crf ${2:-32} -an "${1%.*}-512-${2:-32}.webm"
  success='y'
  vared -p "Did the conversion complete successfully? (y/n) " -c success
  if [ "$success" = "y" ]; then
    mv "${1%.*}-512-${2:-32}.webm" ../3-completed/
    rm "$1"
  fi
}

function ffmpeg-sdr {
  ffmpeg -i "$1" -vf zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p -c:v libx264 -crf 25 -r:v 30 -c:a copy -preset ultrafast -tune fastdecode -max_muxing_queue_size 1024 "${1%.*}-sdr.mkv" 
}

