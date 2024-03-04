
# Chat Bash Utilizando Pipes Nombrados

Este documento detalla la construcción y las instrucciones operativas para una aplicación de chat bash básica diseñada para dos usuarios, utilizando Pipes Nombrados en un entorno Linux. Los Pipes Nombrados facilitan la comunicación entre procesos, sirviendo como columna vertebral para la interacción de los scripts bash.

## Composición del Proyecto

- **chat_X.sh**: Este es el script asignado para el participante X en el chat.
- **chat_Y.sh**: De manera correspondiente, este script está designado para el participante Y.

## Instrucciones Operativas

### Paso 1: Iniciar chat_X.sh
Ejecuta el siguiente comando para iniciar el Chat X, que luego esperará las entradas de usuario para mensajes.
```bash
./chat_X.sh
```

### Paso 2: Iniciar chat_Y.sh en un Terminal Separado
Para comenzar el Chat Y, que recibirá mensajes del Chat X, ejecuta:
```bash
./chat_Y.sh
```

## Mecánica Interna

### Creación de Pipe Nombrado
Cada script inicializa una variable PIPE_X_Y, apuntando al Pipe Nombrado que habilita la comunicación entre los dos participantes.

### Inicialización del Pipe Nombrado
Se verifica la existencia del Pipe Nombrado. Si no está presente, se crea utilizando el comando `mkfifo`.

### Comunicación Bidireccional
Los scripts acceden al Pipe Nombrado en modo de lectura-escritura (exec 3<> "$PIPE_X_Y"), permitiéndoles intercambiar mensajes.

#### Mecánica de Chat X
El script de X lee las entradas del usuario, las reenvía a través del Pipe Nombrado y espera una respuesta del participante Y. Después de enviar un mensaje, se emplea `sync` para pausar hasta que Y reconozca el mensaje.

#### Mecánica de Chat Y
El script Y lee constantemente del Pipe Nombrado, respondiendo después de cada mensaje recibido. Después de recuperar un mensaje, Y espera una respuesta de X antes de proceder.

### Terminación del Chat
Para concluir el chat, se ejecuta `exec 3>&-` para cerrar la conexión del Pipe Nombrado al final de la operación de cada script.

## Conversación de Muestra

En el terminal de Chat X:

```
Chat X iniciado
Hola, ¿qué tal tu día?
Y: Todo bien, gracias. ¿Y el tuyo?
Un poco ajetreado, pero bien.
Y: ¡Ánimo! ¿Quieres hablar de algo en específico?
No, solo quería despejarme un poco charlando.
Y: Entiendo, aquí estaré si necesitas conversar.
Gracias, aprecio mucho eso.
Y: No hay de qué, es bueno apoyarnos.
Bueno, debo continuar. ¡Hablamos luego!
Y: Claro, ¡cuídate!
```

En el terminal de Chat Y:

```
Chat Y iniciado
X: Hola, ¿qué tal tu día?
Bien, gracias. ¿Y el tuyo?
X: Un poco ajetreado, pero bien.
¡Ánimo! ¿Quieres hablar de algo en específico?
X: No, solo quería despejarme un poco charlando.
Entiendo, aquí estaré si necesitas conversar.
X: Gracias, aprecio mucho eso.
No hay de qué, es bueno apoyarnos.
X: Bueno, debo continuar. ¡Hablamos luego!
Claro, ¡cuídate!
```

Asegúrate de que los scripts (chat_X.sh y chat_Y.sh) tengan permisos de ejecución (chmod +x) antes de ejecutarlos.