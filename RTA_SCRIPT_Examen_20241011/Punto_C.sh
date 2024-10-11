#!/bin/bash

PASSWORD=$(openssl passwd -6 "$USER")  

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A1
echo "p1c2_2024_A1:$PASSWORD" | sudo chpasswd
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A2
echo "p1c2_2024_A2:$PASSWORD" | sudo chpasswd
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A3
echo "p1c2_2024_A3:$PASSWORD" | sudo chpasswd
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores p1c2_2024_P1
echo "p1c2_2024_P1:$PASSWORD" | sudo chpasswd

DIRECTORIO_RTA="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-/RTA_ARCHIVOS_Examen_20241011"

sudo mkdir -p "$DIRECTORIO_RTA/Examenes-UTN/alumno_1"
sudo mkdir -p "$DIRECTORIO_RTA/Examenes-UTN/alumno_2"
sudo mkdir -p "$DIRECTORIO_RTA/Examenes-UTN/alumno_3"
sudo mkdir -p "$DIRECTORIO_RTA/Examenes-UTN/profesores"

sudo chown p1c2_2024_A1:p1c2_2024_A1 $DIRECTORIO_RTA/Examenes-UTN/alumno_1
sudo chmod 750 $DIRECTORIO_RTA/Examenes-UTN/alumno_1 

sudo chown p1c2_2024_A2:p1c2_2024_A2 $DIRECTORIO_RTA/Examenes-UTN/alumno_2
sudo chmod 760 $DIRECTORIO_RTA/Examenes-UTN/alumno_2 

sudo chown p1c2_2024_A3:p1c2_2024_A3 $DIRECTORIO_RTA/Examenes-UTN/alumno_3
sudo chmod 700 $DIRECTORIO_RTA/Examenes-UTN/alumno_3

sudo chown p1c2_2024_P1:p1c2_2024_gProfesores $DIRECTORIO_RTA/Examenes-UTN/profesores
sudo chmod 775 $DIRECTORIO_RTA/Examenes-UTN/profesores 

echo "Validación de usuario en la carpeta alumno_1" | sudo tee "$DIRECTORIO_RTA/Examenes-UTN/alumno_1/validar.txt"
whoami | sudo tee -a "$DIRECTORIO_RTA/Examenes-UTN/alumno_1/validar.txt"

echo "Validación de usuario en la carpeta alumno_2" | sudo tee "$DIRECTORIO_RTA/Examenes-UTN/alumno_2/validar.txt"
whoami | sudo tee -a "$DIRECTORIO_RTA/Examenes-UTN/alumno_2/validar.txt"

echo "Validación de usuario en la carpeta alumno_3" | sudo tee "$DIRECTORIO_RTA/Examenes-UTN/alumno_3/validar.txt"
whoami | sudo tee -a "$DIRECTORIO_RTA/Examenes-UTN/alumno_3/validar.txt"

echo "Validación de usuario en la carpeta profesores" | sudo tee "$DIRECTORIO_RTA/Examenes-UTN/profesores/validar.txt"
whoami | sudo tee -a "$DIRECTORIO_RTA/Examenes-UTN/profesores/validar.txt"/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-/RTA_ARCHIVOS_Examen_20241011/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-/RTA_ARCHIVOS_Examen_20241011
