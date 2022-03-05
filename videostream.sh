#Script to open ngrok , stream using VLC test the http link using ffplay
#VLC,FFMPEG,ngrok to be installed

#Open ngrok server and wait for few secs to get the http link
xterm -e ngrok http 8080 &
sleep 5

#Use shell password to open port
sudo -C <pwd> http 8080

#extract the http/https link from ngroks dashboard and store in variable $link
link=$(curl --silent http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo $link

#Use VLC to stream the webcam to  the http 8080..
cvlc v4l2:// :v4l2-vdev="/dev/video0" --sout '#transcode{vcodec=x264{keyint=60,idrint=2},vcodec=h264,vb=400,width=368,heigh=208,acodec=mp4a,ab=32 ,channels=2,samplerate=22100}:duplicate{dst=std{access=http{mime=video/x-ms-wmv},mux=asf,dst=:8080/stream.wmv}}' --no-sout-audio &

#Test locally the http link using ffplay.
ffplay $link/stream.wmv

#ngrok http link can be used in any remote server to view the webcam
© 2022 GitHub, Inc.
