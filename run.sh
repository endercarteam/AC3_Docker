#!/bin/bash

# Función para verificar si el archivo existe
check_file() {
    if [ ! -f "$1" ]; then
        echo "Error: El archivo $1 no existe"
        exit 1
    fi
}

# Función para detectar el lenguaje basado en la extensión
detect_language() {
    filename="$1"
    extension="${filename##*.}"
    
    case "$extension" in
        "py")
            echo "python"
            ;;
        "java")
            echo "java"
            ;;
        "cpp"|"cc")
            echo "cpp"
            ;;
        "js")
            echo "javascript"
            ;;
        "rb")
            echo "ruby"
            ;;
        *)
            echo "Error: Extensión no soportada"
            exit 1
            ;;
    esac
}

# Función para ejecutar el código en el contenedor correspondiente
run_in_container() {
    local file="$1"
    local language="$2"
    local start_time=$(date +%s%N)
    local output
    
    case "$language" in
        "python")
            output=$(docker run --rm -v "$(pwd)":/app -w /app python:3.9 python "$file" 2>&1)
            ;;
        "java")
            # Primero compilamos el archivo Java
            docker run --rm -v "$(pwd)":/app -w /app openjdk:11 javac "$file"
            # Luego ejecutamos la clase compilada
            output=$(docker run --rm -v "$(pwd)":/app -w /app openjdk:11 java "${file%.*}" 2>&1)
            ;;
        "cpp")
            # Compilamos y ejecutamos C++
            docker run --rm -v "$(pwd)":/app -w /app gcc:latest g++ -o program "$file"
            output=$(docker run --rm -v "$(pwd)":/app -w /app gcc:latest ./program 2>&1)
            ;;
        "javascript")
            output=$(docker run --rm -v "$(pwd)":/app -w /app node:14 node "$file" 2>&1)
            ;;
        "ruby")
            output=$(docker run --rm -v "$(pwd)":/app -w /app ruby:latest ruby "$file" 2>&1)
            ;;
    esac
    
    local end_time=$(date +%s%N)
    local duration=$((($end_time - $start_time)/1000000)) # Convertir a milisegundos
    
    echo "=== Salida del programa ==="
    echo "$output"
    echo "=========================="
    echo "Tiempo de ejecución: $duration milisegundos"
}

# Programa principal
main() {
    echo "Por favor, ingrese el nombre del archivo a ejecutar:"
    read filename
    
    # Verificar si el archivo existe
    check_file "$filename"
    
    # Detectar el lenguaje
    language=$(detect_language "$filename")
    echo "Lenguaje detectado: $language"
    
    # Ejecutar en contenedor
    run_in_container "$filename" "$language"
}

# Ejecutar el programa principal
main
