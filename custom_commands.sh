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
file11=1683093901
file12=1683095931
file13=1683096764
file14=1683097385
file15=1683097906
file16=1683098048
file17=1683105076
file18=1683112121

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
root 0 0 93 1 0 10 0 -
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
echo "Stopping all open TEST streams...\n\n" && killall -12 gst-launch-1.0 && echo "\n\nDone!"
STOP Streams
root 0 0 92 1 0 0 0 -
EOF

file_location=$cmd_dir/$file10.html
cat > $file_location <<EOF
This will stop all the open test rtsp streams.
EOF

# 11
file_location=$cmd_dir/$file11.cmd
var="$"
PROFILE_ID=PROFILE_ID
cat > $file_location <<EOF
sed -i "s/ET_API_PROFILE\=.*/ET_API_PROFILE=$var$PROFILE_ID/" "/home/edgetower/projects/edgetower/settings/.env" && sed -i "s/MQTT_TOPIC\=.*/MQTT_TOPIC=$var$PROFILE_ID/" "/home/edgetower/projects/edgetower/settings/.env" && echo "Updated the Profile id.."
Update E:T Device Profile Id
root 0 0 85 1 0 0 0 -
PROFILE_ID:0::0,1:Profile id
EOF

file_location=$cmd_dir/$file11.html
cat > $file_location <<EOF
EOF

# 12
file_location=$cmd_dir/$file12.cmd
var="$"
TOKEN=TOKEN
cat > $file_location <<EOF
sed -i "s/ET_API_TOKEN\=.*/ET_API_TOKEN=$var$TOKEN/" "/home/edgetower/projects/edgetower/settings/.env" && echo "Updated the Profile Token.."
Update E:T Profile Token
root 0 0 84 1 0 0 0 -
TOKEN:0::0,1:Token
EOF

file_location=$cmd_dir/$file12.html
cat > $file_location <<EOF
EOF

# 13
file_location=$cmd_dir/$file13.cmd
var="$"
H_URL=H_URL
cat > $file_location <<EOF
sed -i "s~SYN_URL\=.*~SYN_URL=$var$H_URL~" "/home/edgetower/projects/edgetower/settings/.env" && echo "Updated the Synapse URL.." 
Update Synapse URL
root 0 0 83 1 0 0 0 -
H_URL:0::0,1:Synapse URL
EOF

file_location=$cmd_dir/$file13.html
cat > $file_location <<EOF
EOF

# 14
file_location=$cmd_dir/$file14.cmd
var="$"
TOKEN=TOKEN
cat > $file_location <<EOF
sed -i "s/SYN_TOKEN\=.*/SYN_TOKEN=$var$TOKEN/" "/home/edgetower/projects/edgetower/settings/.env" && echo "Updated the Synapse Token.."
Update the Synapse Token
root 0 0 82 1 0 0 0 -
TOKEN:0::0,1:Token
EOF

file_location=$cmd_dir/$file14.html
cat > $file_location <<EOF
EOF

# 15
file_location=$cmd_dir/$file15.cmd
cat > $file_location <<EOF
sed -i "s/SYN_CONNECT\=.*/SYN_CONNECT=True/" "/home/edgetower/projects/edgetower/settings/.env" && echo "Synapse Connect Enabled"
Enable Synapse Connect
root 0 0 81 1 0 0 0 -
EOF

file_location=$cmd_dir/$file15.html
cat > $file_location <<EOF
EOF

# 16
file_location=$cmd_dir/$file16.cmd
cat > $file_location <<EOF
sed -i "s/SYN_CONNECT\=.*/SYN_CONNECT=False/" "/home/edgetower/projects/edgetower/settings/.env" && echo "Synapse Connect Disabled"
Disable Synapse Connect
root 0 0 80 1 0 0 0 -
EOF

file_location=$cmd_dir/$file16.html
cat > $file_location <<EOF
EOF

# 17
file_location=$cmd_dir/$file17.cmd
cat > $file_location <<EOF
echo "Enabling E:T Service..." && sudo systemctl enable edgetower.service
Enable E:T Service
root 0 0 95 1 0 0 0 -
EOF

file_location=$cmd_dir/$file17.html
cat > $file_location <<EOF
Required only once
EOF

# 18
file_location=$cmd_dir/$file18.cmd
var="$"
GATEWAY=GATEWAY
cat > $file_location <<EOF
sed -i "s/gateway\ .*/gateway $var$GATEWAY/" "/etc/network/interfaces" && echo "Updated the Default Gateway.."
Update Gateway
root 0 0 94 1 0 0 0 -
GATEWAY:0::0,1:Gateway
EOF

file_location=$cmd_dir/$file18.html
cat > $file_location <<EOF
EOF
