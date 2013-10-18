args=( $@ )
nu=${#args[@]}
if [[ $nu -eq 0 ]]; then
	echo "Usage: sh <script> input.txt output"
	exit
fi
# http://stackoverflow.com/questions/9006596/is-the-unix-time-command-accurate-enough-for-benchmarks
# https://news.ycombinator.com/reply?id=6560202&whence=item%3fid%3d6559011
printf "\nsh"
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" sh sort_lines.sh $1 $2_sh.txt
printf "\ngo"
go build sort_lines.go
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ./sort_lines $1 $2_go.txt
[ -f "sort_lines" ] && rm sort_lines
printf "\npython"
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" python -S sort_lines.py $1 $2_py.otxt
printf "\nruby"
touch $2_rb.txt
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ruby sort_lines.rb $1 $2_rb.txt
printf "\nc++"
g++ -std=c++11 sort_lines.cpp
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ./a.out $1 $2_go.txt
[ -f "a.out" ] && rm a.out

echo
echo "For more go to https://news.ycombinator.com/item?id=6559011"
