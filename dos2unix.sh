# http://stackoverflow.com/questions/2613800/how-to-convert-dos-windows-newline-to-unix-newline-in-bash-script/2613834#2613834
# http://stackoverflow.com/questions/1068650/using-awk-to-remove-the-byte-order-mark/3622153#3622153
sed -e 's/$//' -e '1 s/^\xef\xbb\xbf//' "$1" > "$2"
