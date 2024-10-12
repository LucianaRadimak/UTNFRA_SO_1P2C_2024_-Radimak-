#!/bin/bash

DISK="/dev/sdc"
MOUNT_DIR="/home/vagrant"
PART_SIZE=1

sudo parted $DISK --script mklabel gpt

for i in {1..3}; do
  START=$(( (i - 1) * PART_SIZE ))
  END=$(( START + PART_SIZE ))
  sudo parted $DISK --script mkpart primary ext4 ${START}GB ${END}GB
done

sudo parted $DISK --script mkpart extended 3GB 10GB

for i in {1..7}; do
  START=$(( 3 + (i - 1) * PART_SIZE ))
  END=$(( START + PART_SIZE ))
  sudo parted $DISK --script mkpart logical ext4 ${START}GB ${END}GB
done

sudo fdisk -l $DISK

for i in {1..3}; do
  sudo mkfs -t ext4 ${DISK}${i}
done

for i in {5..11}; do
  sudo mkfs -t ext4 ${DISK}${i}
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
