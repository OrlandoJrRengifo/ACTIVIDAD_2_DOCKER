#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"

if [ ! -f "$archivo" ]; then
    echo "Error: el archivo '$archivo' no existe."
    exit 1
fi

extension="${archivo##*.}"

# lenguaje no soportado
function LENGUAJE_NO_SOPORTADO() {
    echo "Lenguaje no soportado, solo se admiten: Python (.py), Java (.java), C++ (.cpp, .cc), JavaScript (.js), Ruby (.rb)."
    exit 1
}

# Detección del lenguaje
case "$extension" in
    py)
        lenguaje="python"
        ;;
    java)
        lenguaje="java"
        ;;
    cpp|cc)
        lenguaje="cpp"
        ;;
    js)
        lenguaje="javascript"
        ;;
    rb)
        lenguaje="ruby"
        ;;
    *)
        LENGUAJE_NO_SOPORTADO
        ;;
esac

inicio=$(date +%s%3N)

case "$lenguaje" in
    python)
        docker run --rm -v "$(pwd)":/app python:3.9 bash -c "python /app/$archivo"
        ;;
    java)
        clase=$(basename "$archivo" .java)
        docker run --rm -v "$(pwd)":/app openjdk:11 bash -c "javac /app/$archivo && java -cp /app $clase"
        ;;
    cpp)
        docker run --rm -v "$(pwd)":/app gcc:latest bash -c "g++ /app/$archivo -o /app/a.out && /app/a.out"
        ;;
    javascript)
        docker run --rm -v "$(pwd)":/app node:14 bash -c "node /app/$archivo"
        ;;
    ruby)
        docker run --rm -v "$(pwd)":/app ruby:2.7 bash -c "ruby /app/$archivo"
        ;;
    *)
        LENGUAJE_NO_SOPORTADO
        ;;
esac

fin=$(date +%s%3N)
tiempo_total=$((fin - inicio))

echo -e "\nTiempo total de ejecución: ${tiempo_total} ms"
