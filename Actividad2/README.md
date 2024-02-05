Alberto Gabriel Reyes Ning 201612174

Sistemas Operativos 1 Actividad 2 1S2024

Actividad 2:

Crear un script en BASH que permita consultar los datos de un usuario de GITHUB. Los datos del usuario seran descargado de un webservice. Luego este debera de escribir un log con algunos de los datos del usario.

Tareas a realizar por el script:

- Lea la variable ***GITHUB\_USER***
- Consulte la URL ***https://api.github.com/users/*** concatenando el valor de la variable GITHUB\_USER al final
- Imprimir el mensaje: “Hola ***<github\_user>***. User ID: ***<id>***. Cuenta fue creada el: ***<created\_at>***.” Los valores entre los signos ***<>*** deben de ser tomados del JSON colsutado previamente.
- Crear un log file en ***/tmp/<fecha>/saludos.log*** con la salida del mensaje anterior. Donde ***<fecha>*** corresponde a la fecha del día de ejecución del script
- Crear un cronjob para que el script se ejecute cada 5 minutos

![A computer screen shot of text

Description automatically generated](Aspose.Words.5a339224-e25a-498a-b114-d6c65d6f1e7d.001.png)Script 

Cronjob:

![](Aspose.Words.5a339224-e25a-498a-b114-d6c65d6f1e7d.002.png)

Archivo Creado:

![](Aspose.Words.5a339224-e25a-498a-b114-d6c65d6f1e7d.003.png)

Texto del archivo:

![A black background with white text

Description automatically generated](Aspose.Words.5a339224-e25a-498a-b114-d6c65d6f1e7d.004.png)
