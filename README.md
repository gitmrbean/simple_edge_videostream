# simple_edge_videostream

Simple setup to stream webcam videos behind router/double NAT  via http,rtsp ot rtp for newbies

Useful for real time video application for newbies with minimal network hasseles

**Setup**

Install ffmpeg and VLC in Ubuntu.
or Have camera connected to raspberry pi.

1.Webcam server through vlc


 cvlc v4l2:// :v4l2-vdev="/dev/video0" --sout '#transcode{vcodec=x264{keyint=60,idrint=2},vcodec=h264,vb=400,width=368,heigh=208,acodec=mp4a,ab=32 ,channels=2,samplerate=22100}:duplicate{dst=std{access=http{mime=video/x-ms-wmv},mux=asf,dst=:8080/stream.wmv}}' --no-sout-audio
 
2.Tunnelling behind router

Usually done by portforwarding .Issues if router is provided private ip by ISP(double NAT)
VNC is an option.But again issues with portforwading needed some time

For quick setup can try to install ngrok https://ngrok.com/ and use simple configuration
 ngrok <protocol> <port>
 ex.
  ngrok http 8080
  
  it gives a link that can be accessed behind any network 
  ex  http://a3b4-2406-7400-63-c8ef-7581-c1f2-270b-a889.ngrok.io -> http://localhost:8080
   
3.Enable ports for communication in Linux
 
  sudo ufw <port> allow
  
4.Check the http stream locally as well as outside network
 
  ffplay < ngrok link >
 
 
  
  Its Done.In short span we can setup a video server in laptop or edge devices and stream virtually anywhere in internet.
