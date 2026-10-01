#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: debes proporcionar un numero de puerto"
    exit 1
fi

PORT=$1
HOST=${2:-localhost}

nc -z -v $HOST $PORT 2>/dev/null

if [ $? -eq 0 ]; then
    echo "El puerto $PORT en $HOST esta ABIERTO"
else
    echo "El puerto $PORT en $HOST esta CERRADO"
fi
