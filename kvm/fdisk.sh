disk=/dev/vdb
partition=/dev/vdb1
cat << EOF | fdisk $disk
n
p



w
EOF
partprobe $disk
mkfs.xfs $partition
mount $partition /home/public
