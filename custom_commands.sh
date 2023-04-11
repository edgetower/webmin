#!/bin/bash

cmd_dir=/etc/webmin/custom

file1=1671107015
file2=1680945403
file3=1680945814
file4=1680945922
file5=1680948120
file6=1680952544
file7=config
file8=etguest
file9=1681122159
file10=1681196588

# 1
file_location=$cmd_dir/$file1.cmd
cat > $file_location <<EOF
ping -c 5 google.com
Ping Internet
* 0 0 101 0 0 0 0 -
EOF

file_location=$cmd_dir/$file1.html
cat > $file_location <<EOF
EOF

# 2
file_location=$cmd_dir/$file2.cmd
cat > $file_location <<EOF
echo "Restarting E:T Service...\n\nThis takes about 3min to complete." && sudo systemctl restart edgetower.service
Restart E:T Service
edgetower 0 0 97 1 0 300 0 -
EOF

file_location=$cmd_dir/$file2.html
cat > $file_location <<EOF
ETA +/-3min to complete.
EOF

# 3
file_location=$cmd_dir/$file3.cmd
cat > $file_location <<EOF
echo "Restarting Device...\n\nThis takes about 5min to complete." && sudo reboot now
Reboot Device
edgetower 0 0 96 1 0 0 0 -
EOF

file_location=$cmd_dir/$file3.html
cat > $file_location <<EOF
ETA +/- 5min to complete.
EOF

# 4
file_location=$cmd_dir/$file4.cmd
cat > $file_location <<EOF
cat /home/edgetower/projects/edgetower/logs/et.log
Check E:T log
edgetower 0 0 98 1 0 0 0 -
EOF

file_location=$cmd_dir/$file4.html
cat > $file_location <<EOF
EOF

# 5
file_location=$cmd_dir/$file5.cmd
cat > $file_location <<EOF
journalctl -u edgetower.service --since today
Check E:T Service Log
edgetower 0 0 99 0 0 0 0 -
EOF

file_location=$cmd_dir/$file5.html
cat > $file_location <<EOF
EOF

# 6
file_location=$cmd_dir/$file6.cmd
var="$"
var2=IP
cat > $file_location <<EOF
ping -c 5 $var$var2
Ping IP Address
* 0 0 100 0 0 0 0 -
IP:0:8.8.8.8:0,1:IP Address (x.x.x.x)
EOF

file_location=$cmd_dir/$file6.html
cat > $file_location <<EOF
EOF

# 7
file_location=$cmd_dir/$file7
cat > $file_location <<EOF
columns=1
params_file=0
params_cmd=0
display_mode=0
EOF

# 8
file_location=$cmd_dir/$file8.acl
cat > $file_location <<EOF
noconfig=1
edit=0
cmds=*
EOF

# 9
file_location=$cmd_dir/$file9.cmd
var="$"
USER=USER
PASS=PASS
RTSP_stream=RTSP_stream
cat > $file_location <<EOF
echo "Wait for [Setting pipeline to PLAYING]. If this is not displayed, then the stream did not open...\n\nIf the stream is PLAYING:\n 1. Manually stop the stream with the STOP Streams Command to avoid opening multiple streams.\n\nIf the stream did not open:\n 1. Please recheck the camera configs.\n 2. Check username and password.\n\n" && sleep 3 && echo "Executing command..\n\n" && sleep 2 && gst-launch-1.0 rtspsrc user-id=$var$USER user-pw=$var$PASS location=$var$RTSP_stream ! application/x-rtp, media=video, clock-rate=90000, encoding-name=H264 ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! videorate ! video/x-raw, width=640, height=368, framerate=4/1 ! fakesink sync=false
Test RTSP Stream
root 0 0 95 1 0 10 0 -
RTSP_stream:0::0,1:RTSP Stream
USER:0::0,1:Username
PASS:0::0,1:Password
EOF

file_location=$cmd_dir/$file9.html
cat > $file_location <<EOF
EOF

# 10
file_location=$cmd_dir/$file10.cmd
cat > $file_location <<EOF
killall -12 gst-launch-1.0
STOP Streams
root 0 0 94 1 0 0 0 -
EOF

file_location=$cmd_dir/$file10.html
cat > $file_location <<EOF
This will stop all the open test rtsp streams.
EOF
