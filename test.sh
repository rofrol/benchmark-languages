input="input.txt"
output="output"
bash make_input.bash
#http://stackoverflow.com/questions/9006596/is-the-unix-time-command-accurate-enough-for-benchmarks
#https://news.ycombinator.com/reply?id=6560202&whence=item%3fid%3d6559011
printf "\nsh"
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" sh sort_lines.sh "$input" "${output}_sh.txt"
printf "\ngo"
go build sort_lines.go
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ./sort_lines "$input" "${output}_go.txt"
[ -f "sort_lines" ] && rm sort_lines
printf "\npython"
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" python -S sort_lines.py "$input" ${output}_py.txt
printf "\nruby"
touch "${output}_rb.txt"
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ruby sort_lines.rb "$input" "${output}_rb.txt"
printf "\nc++"
g++ -std=c++11 sort_lines.cpp
sudo chrt -f 99 /usr/bin/time -f "\n***\ntime: %E\ncontext switches: %c\nwaits: %w" ./a.out "$input" "${output}_go.txt"
[ -f "a.out" ] && rm a.out
