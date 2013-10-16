package main
import "io/ioutil"
import "strings"
import "os"
func main() {
	b, _ := ioutil.ReadFile(os.Args[1]) // Not interested in error handling now
	str := string(b)
	str = strings.Replace(str, "\r\n", "\n" , -1)
	str = strings.Replace(str, "\xef\xbb\xbf", "" , 1)
	_ = ioutil.WriteFile(os.Args[2], []byte(str), 0600)
}
