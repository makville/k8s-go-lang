package main

import (
	"net/http"
	"os"
)

func requestHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World, Go!"))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}
	
	muxServer := http.NewServeMux()
	
	muxServer.HandleFunc("/", requestHandler)
	http.ListenAndServe(":"+port, muxServer)
}
