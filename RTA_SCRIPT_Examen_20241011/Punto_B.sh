#!/bin/bash
sudo parted /dev/sdc --script mklabel gpt
for i in {1..3}; do
  sudo parted /dev/sdc --script mkpart primary ext4 1GB $((1 + i))GB
done
for i in {1..8}; do
  if (( i == 1 )); then
    sudo parted /dev/sdc --script mkpart extended 4GB 10GB
  fi
  sudo parted /dev/sdc --script mkpart logical ext4 $((4 + i - 1))GB $((4 + i))GB
done
sudo fdisk -l /dev/sdc
for i in {1..3}; do
  sudo mkfs -t ext4 /dev/sdc$i
done

for i in {5..11}; do
  sudo mkfs -t ext4 /dev/sdc$i
done
echo "/dev/sdc1 /home/vagrant/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc2 /home/vagrant/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc3 /home/vagrant/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc5 /home/vagrant/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /home/vagrant/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /home/vagrant/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /home/vagrant/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /home/vagrant/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /home/vagrant/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc11 /home/vagrant/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
df -h
