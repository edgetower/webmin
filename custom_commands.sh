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
sudo systemctl restart edgetower.service
Restart E:T Service
edgetower 0 0 97 1 0 300 0 -
EOF

file_location=$cmd_dir/$file2.html
cat > $file_location <<EOF
This command will restart services. Takes about 3min to complete.
EOF

# 3
file_location=$cmd_dir/$file3.cmd
cat > $file_location <<EOF
sudo reboot now
Reboot Device
edgetower 0 0 96 1 0 0 0 -
EOF

file_location=$cmd_dir/$file3.html
cat > $file_location <<EOF
This command will restart the device. This takes about 5min to complete.
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
Ping IP
* 0 0 100 0 0 0 0 -
IP:0:8.8.8.8:0,1:Provide a IP (x.x.x.x)
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
