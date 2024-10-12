#!/bin/bash

DIRECTORIO_RTA="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-/RTA_ARCHIVOS_Examen_20241011"

ARCHIVO="$DIRECTORIO_RTA/Filtro_Basico.txt"


echo "Información de la Memoria RAM total:" > "$ARCHIVO"
grep "MemTotal" /proc/meminfo >> "$ARCHIVO"

echo -e "\nInformación del fabricante del Chassis:" >> "$ARCHIVO"
sudo dmidecode -t chassis | grep "Manufacturer" >> "$ARCHIVO"

cat "$ARCHIVO"
