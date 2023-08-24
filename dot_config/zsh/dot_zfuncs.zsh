nvall () {
	if [ -z "$1" ]
	then
		echo "No filetype given"
	else
		fd -e "$@" -X nvim -p 
	fi
}

