# BashScripts
mkprj - a bash script that automates creating c files and headers
mkprj [-nc] projectName [fileName] [fileName] ...
-nc = flag for specifing if the project shall be opened in visual studio code
projectName - if only this argument is specified the script will create a folder with the specified name and a main.c
The user can add aditional arguments for creating .h and .c files

./mkprj myproject
This script will create a folder myproject in which will be main.c

./mkprj myproject2 file1
This script will create a folder myproject in which will be main.c plus file1.c and file1.h. It automatically includes .h in the main.c
