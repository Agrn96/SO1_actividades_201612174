#!/bin/bash
 
#Leer la variable de entorno GITHUB_USER
GITHUB_USER=$GITHUB_USER

# Consultar la URL de GitHub y almacenar la respuesta
RESPONSE=$(curl -s https://api.github.com/users/${GITHUB_USER})

# Extraer los datos necesarios del JSON
USER_NAME=$(echo $RESPONSE | jq -r '.login')
USER_ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

# Imprimir el mensaje
MESSAGE="Hola ${USER_NAME}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}."
echo $MESSAGE
 
# Crear el directorio de log basado en la fecha si no existe
LOG_DIR="/tmp/$(date +%F)"
mkdir -p $LOG_DIR

# Escribir el mensaje en el archivo de log
echo $MESSAGE >> "${LOG_DIR}/saludos.log"

# Comprueba si existe un crontab para el usuario
if crontab -l &>/dev/null; then
		# Anade el cron job para ejecutar este script cada 5 minutos
		(crontab -l ; echo "*/5 * * * * ~/scripts/github_user_info.sh") | crontab -
	else
		# Si no existe crontab, crea uno nuevo con la tarea cron
		echo "*/5 * * * * ~/scripts/github_user_info.sh" | crontab -
fi