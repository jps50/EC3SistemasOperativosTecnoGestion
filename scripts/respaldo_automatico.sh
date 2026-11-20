#!/bin/bash

# Respaldo de archivos empresariales - TecnoGestion S.A.C.
# Proyecto Sistemas Operativos EC3

ORIGEN="/srv/empresa/"
DESTINO="/var/backups/empresa/"

echo "Iniciando respaldo empresarial..."
rsync -a "$ORIGEN" "$DESTINO"
echo "Respaldo finalizado."
