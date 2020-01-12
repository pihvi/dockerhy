package main

import (
	"math/rand"
	"net/http"
)

var a = 0

func response(rw http.ResponseWriter, request *http.Request) {
	for i := int64(1); i <= 10000000; i++ {
		a = rand.Int() / rand.Int()
	}
	println(a)
	request.ParseForm()
	x := request.Form.Get("name")
	rw.Write([]byte("Hello " + x))
}

func main() {
	http.HandleFunc("/", response)
	http.ListenAndServe(":3000", nil)
}
