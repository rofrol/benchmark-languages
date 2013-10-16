printf "\nsh"
time sh sort_lines.sh $1 $2_sh.txt
printf "\ngo"
go build sort_lines.go
time ./sort_lines $1 $2_go.txt
printf "\npython"
time python -S sort_lines.py $1 $2_py.otxt
printf "\nruby"
touch $2_rb.txt
time ruby sort_lines.rb $1 $2_rb.txt

echo
echo "For more go to https://news.ycombinator.com/item?id=6559011"
