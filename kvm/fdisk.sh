disk=/dev/vdb
partition=/dev/vdb1
cp -r /var/lib /root/lib
cat << EOF | fdisk $disk
n
p



w
EOF
partprobe $disk
mkfs.xfs $partition
mount $partition /var/lib
cp -r /root/lib /var
rm -rf /root/lib
