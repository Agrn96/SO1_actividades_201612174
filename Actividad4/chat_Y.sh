#!/bin/bash
PIPE_X_Y="/tmp/pipe_x_y"

if [[ ! -p $PIPE_X_Y ]]; then
    mkfifo $PIPE_X_Y
fi

function receiveMessage() {
    while true; do
        if read line <$PIPE_X_Y; then
            echo "$line"
            if [[ "$line" == "X: bye" ]]; then
                break
            fi
            echo "Enter reply:"
            read reply
            echo "Y: $reply" > $PIPE_X_Y
            if [[ "$reply" == "bye" ]]; then
                break
            fi
        fi
    done
}

echo "Chat Y initiated"
receiveMessage

exec 3>&-

echo "Chat Y terminated"
