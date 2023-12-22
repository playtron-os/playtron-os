rm -f playtron-os.img
fallocate -l 8G playtron-os.img
anaconda --noninteractive --text --kickstart=$(pwd)/playtron-os_kickstart.cfg --image=playtron-os.img
