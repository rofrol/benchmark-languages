package main
import "io/ioutil"
import "sort"
import "strings"
import "os"
func main() {
	b, _ := ioutil.ReadFile(os.Args[1]) // Not interested in error handling now
	lines := strings.Split(string(b), "\n")
	lines = lines[:len(lines)-1] // Split adds empty line at the end
	sort.Strings(lines)
	_ = ioutil.WriteFile(os.Args[2], []byte(strings.Join(lines, "\n")), 0600)
}
