#!/bin/bash

make_directory_and_main (){
	if [ -d "./$1" ]; then 
		echo "Project named $1 already exists"
		exit 1
	fi
	mkdir $1 && echo -e "#include <stdio.h>\nint main(int argc , char **argv){\n\treturn 0;\n}" >> $_/main.c
}

make_h_and_c (){
	upper=$(echo $1 | tr '[:lower:]' '[:upper:]')

	sed -i "1s/^/#include \"$1.h\"\n/" $2/"main.c" 
       	echo -e "#ifndef $upper"_H"\n#define $upper"_H"\n\n\n#endif" >> $2/$1".h"
	echo -e "#include \"$1.h\"" >> $2/$1".c" 	
}


if [ "$#" -lt 1 ]; then 
	echo "Provide at least one argument u dumbass hope u die a horrible death"
	exit 1
fi

vscode="true"
if [ "$1" ==  "-nc" ]; then
	vscode="false"
	shift
fi

if [ "$#" -eq 0 ]; then
	echo "No project name was provided"
	exit 1
fi

if [ "$#" -eq 1 ]; then 
	dir=$1
	make_directory_and_main $1
else
	make_directory_and_main $1
	dir=$1
	shift
	while test $# -gt 0 
	do
		make_h_and_c $1 $dir
		shift
	done
fi



