# Proyect-about-collect-work-with-and-clean-a-data-set.
#Parte número 1:
En esta parte del proyecto, primero, se leyeron todos los data sets que se encontraban en el archivo de Samsung.
Luego se utilizó la funcion rbind() para unir los data sets.

#Parte número 2:
En esta parte, se utilizó la función grep() que permitió hallar las palabras que contenian a mean y a std en el data set principal, con el uso de Expresiones Regulares.
Aqui se borraron aquellas columnas que no contenian la palabra mean y std ya que no eran de interés.

#Parte número 3:
Con el archivo activity_labels.txt se pudo nombrar cada una de las actividades con su nombre.

#Parte número 4:
Se usó la función gsub() y las expresiones regulares para cambiar aquellos nombre que eran poco explícitos y se cambiaron por aquellos que dieran mas sentido a la variable.

#Parte número 5:
Con la funcion aggregate() se pudo seccionar el data set de acuerdo a los nombres de las actividades y los sujetos, para sacar el promedio de cada medida.
Con la funcion order() se ordenó el data set de acuerdo a los nombres de las actividades y los sujetos.







