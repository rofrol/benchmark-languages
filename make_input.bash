#!/bin/bash
function fileSize {
	echo $(stat -c '%s' "$1")
}
[ -f pg76.txt ] || wget http://www.gutenberg.org/cache/epub/76/pg76.txt
file="pg76.txt"
input="input.txt"
[ -f "$input" ] || touch "$input"
size=$(fileSize ""$input"")
while (( $size < 50000000 )) ; do
	size=$(fileSize ""$input"")
	cat "$file" >> "$input"
done
echo "file $input size $size"
