printf "\nsh"
time sh sort_lines.sh $1 $2_sh.txt
printf "\ngo"
time go run sort_lines.go $1 $2_go.txt
printf "\npython"
time python sort_lines.py $1 $2_py.otxt
printf "\nruby"
touch $2_rb.txt
time ruby sort_lines.rb $1 $2_rb.txt

echo
echo "For more go to https://news.ycombinator.com/item?id=6559011"
