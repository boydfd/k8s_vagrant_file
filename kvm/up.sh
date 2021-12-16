vagrant up master slave1 slave2 slave3 hdp_master hdp_slave1 hdp_slave2

# k8s
vagrant ssh master -- -t 'sudo systemctl restart firewalld; sudo mount /dev/vdb1 /var/lib; sudo systemctl stop kubelet; sudo systemctl stop docker; sudo iptables --flush; sudo iptables -tnat --flush; sudo systemctl start kubelet; sudo systemctl start docker; sudo swapoff -a; sudo systemctl restart kubelet.service; sudo ip route add 192.168.0.105 via 192.168.121.1 dev eth0; sudo iptables -A FORWARD -i weave  -j ACCEPT; sudo iptables -A FORWARD -j ACCEPT'
vagrant ssh slave1 -- -t 'sudo systemctl restart firewalld; sudo mount /dev/vdb1 /var/lib; sudo systemctl stop kubelet; sudo systemctl stop docker; sudo iptables --flush; sudo iptables -tnat --flush; sudo systemctl start kubelet; sudo systemctl start docker; sudo swapoff -a; sudo systemctl restart kubelet.service; sudo ip route add 192.168.0.105 via 192.168.121.1 dev eth0; sudo iptables -A FORWARD -i weave  -j ACCEPT; sudo iptables -A FORWARD -j ACCEPT'
vagrant ssh slave2 -- -t 'sudo systemctl restart firewalld; sudo mount /dev/vdb1 /var/lib; sudo systemctl stop kubelet; sudo systemctl stop docker; sudo iptables --flush; sudo iptables -tnat --flush; sudo systemctl start kubelet; sudo systemctl start docker; sudo swapoff -a; sudo systemctl restart kubelet.service; sudo ip route add 192.168.0.105 via 192.168.121.1 dev eth0; sudo iptables -A FORWARD -i weave  -j ACCEPT; sudo iptables -A FORWARD -j ACCEPT'
# k8s end

# mysql for hdp
vagrant ssh slave3 -- -t 'sudo mount /dev/vdb1 /var/lib;sudo systemctl restart mysqld;sudo /home/vagrant/up.sh'

# mysql for hdp end

# hdp

vagrant ssh hdp_master -- -t 'sudo mount /dev/vdb1 /var/lib;sudo ambari-server start;sudo ambari-agent start'
vagrant ssh hdp_slave1 -- -t 'sudo mount /dev/vdb1 /var/lib;sudo ambari-agent start'
vagrant ssh hdp_slave2 -- -t 'sudo mount /dev/vdb1 /var/lib;sudo ambari-agent start'

# hdp end

