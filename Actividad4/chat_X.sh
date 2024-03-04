#!/bin/bash
PIPE_X_Y="/tmp/pipe_x_y"

if [[ ! -p $PIPE_X_Y ]]; then
    mkfifo $PIPE_X_Y
fi

function sendMessage() {
    echo "X: $1" > $PIPE_X_Y
}

function receiveMessage() {
    while true; do
        if read line <$PIPE_X_Y; then
            echo "$line"
            if [[ "$line" == "Y: bye" ]]; then
                break
            fi
        fi
    done
}

echo "Chat X initiated"
while true; do
    echo "Enter message:"
    read input
    sendMessage "$input"
    if [[ "$input" == "bye" ]]; then
        break
    fi
    receiveMessage
done

exec 3>&-

echo "Chat X terminated"
