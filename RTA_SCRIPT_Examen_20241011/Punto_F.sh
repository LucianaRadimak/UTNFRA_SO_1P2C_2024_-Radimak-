#!/bin/bash

DIRECTORIO_RTA="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-/RTA_ARCHIVOS_Examen_20241011"

ARCHIVO="$DIRECTORIO_RTA/Filtro_Avanzado.txt"

echo "mi IP Pública es:" > "$ARCHIVO"
curl -s ifconfig.me >> "$ARCHIVO"

echo -e "\nMi usuario es:" >> "$ARCHIVO"
whoami >> "$ARCHIVO"

echo -e "\nEl Hash de mi Usuario es:" >> "$ARCHIVO"
sudo grep "^$(whoami):" /etc/shadow | cut -d: -f2 >> "$ARCHIVO"

echo -e "\nLa URL de mi Repositorio Remoto es:" >> "$ARCHIVO"
cd /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Radimak-
git remote get-url origin >> "$ARCHIVO"
