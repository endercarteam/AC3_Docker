# AC3_Docker
## Descripcion:
mediante el uso de un archivo .sh (shell) sera posible ejecutar archivos que se encuentren dentro de la carpeta del mismo archivo con solo colocar el nombre del archivo y su extencion de la siguiente manera: nombrearchivo.py 
## Lenguajes soportados:
- Java
- Python
- Ruby
- Javascript
- C++
## Requisitos
- tener Docker instalado
- usar una terminal Alpine Linux
- instalar git
## Notas importantes:
- de preferencia usar esta iplementacion en una terminal proporcionada en el laboratorio docker "Play with docker" link: https://labs.play-with-docker.com/
- la primera vez que se ejecute un archivo de una extencion que aun no ha sido usada, se instalaran en los contenedores de ejecucion las dependencias necesarias, esto sera automatico, el usuario solo debera ingresar el archivo con su extencion de la manera indicada mas adelante.
## Pasos para la ejecucion
# solo hace falta copiar y pegar en la consola (shift + insert) los comandos
1. git clone "https://github.com/endercarteam/AC3_Docker.git"
2. cd AC3_Docker
3. chmod +x run.sh
### cada vez que nos dispongamos a ejecutar un programa enviar este comando   
5. ./run.sh
### se nos pedira en consola que digitemos el nombre del archivo, digitarlo sin espacios y con su respectiva extencion, como el ejemplo que aparece abajo   
6. validacion1.py
# ADICIONAL
si usted desea ejecutar un archivo propio siga estos pasos, despues de seguir los de ejecucion
### instalar editor de texto
1. apk add nano
### crear el archivo, de la manera mostrada "nombre archivo.extencion"
2. nano nombre.py
### copiar codigo fuente al archivo recien creado
3. shift + insert
### guardar cambios
4. ctrl + o
5. enter
### cerrar editor de texto
5. ctrl + x   
7. ejecutar comando de ejecucion y digitar nombre del archivo junto con su extencion "nombreArchivo.py"
