# CIU - Práctica 7

Autor: Héctor Miguel Martín Álvarez

## Introducción

Aplicación que permite al usuario seleccionar cualquier imagen JPG o PNG de dimensiones menor o igual a 1920x1080 y en base al nivel de brillo de los pixeles de la imagen generara un simple canción mientras se dibuja la imagen seleccionada.

## Desarrollo

El proyecto ha sido desarrollado empleando 3 ficheros: 
  - <b>CIU_7</b> </br><p>Fichero principal del proyecto desde el que se dibuja la imagen selecionada progresivamente y se generan los tonos en base al nivel de brillo de los pixeles.</p>
  - <b>End</b> </br><p>Fichero que implementa una ventana con las dos opciones disponibles tras terminar de dibujar la imagen seleccionada anteriormente.</p>
  - <b>FileExplorer</b> </br><p>Fichero que implementa un JFileChooser que permite al usuario seleccionar una imagen de su ordenador.</p>

## Características

  - Posibilidad de reiniciar la canción en cualquier momento.
  - Posibilidad de terminar la canción en cualquier momento.
  - Posibilidad de seleccionar cualquier imagen JPG o PNG de dimensiones menor o igual a 1920x1080.
  - Prevención de error ante la seleccion de un archivo que no pertenezca al conjunto de archivos validos (JPG, PNG).

## Controles

|Tecla|Descripción|
|:---:|:----------:|
|R|Reiniciar Canción|
|F|Terminar Canción|

## Herramientas
  - Processing 3.5.4

## Referencias
  - [Material de la asignatura Creando Interfaces de Usuario](https://github.com/otsedom/otsedom.github.io)
  - [Documentación de Processing](https://processing.org/reference)
