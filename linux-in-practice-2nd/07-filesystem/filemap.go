package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"strconv"
	"syscall"
)

func main() {

	catTestfile()

	pid := os.Getpid()
	fmt.Println("*** testfileのメモリマップ前のプロセスの仮想アドレス空間 ***")
	command := exec.Command("cat", "/proc/"+strconv.Itoa(pid)+"/maps")
	command.Stdout = os.Stdout
	err := command.Run()
	if err != nil {
		log.Fatal("catの実行に失敗しました")
	}

	file, err := os.OpenFile("testfile", os.O_RDWR, 0)
	if err != nil {
		log.Fatal("testfileを開けませんでした")
	}
	defer file.Close()

	// mmap()システムコールの呼び出しによって5バイトのメモリ領域を獲得
	data, err := syscall.Mmap(int(file.Fd()), 0, 5, syscall.PROT_READ|syscall.PROT_WRITE, syscall.MAP_SHARED)
	if err != nil {
		log.Fatal("mmap()に失敗しました")
	}

	fmt.Println("")
	fmt.Printf("testfileをマップしたアドレス: %p\n", &data[0]) // the address of the first element of data
	fmt.Println("")

	fmt.Println("*** testfileのメモリマップ後のプロセスの仮想アドレス空間 ***")
	command = exec.Command("cat", "/proc/"+strconv.Itoa(pid)+"/maps")
	command.Stdout = os.Stdout
	err = command.Run()
	if err != nil {
		log.Fatal("catの実行に失敗しました")
	}

	fmt.Println("testfileの中身を書き換えます")

	// マップしたファイルの中身を書き換える
	replaceBytes := []byte("HELLO")
	for i, _ := range data {
		data[i] = replaceBytes[i] // replace the content of data with replaceBytes byte by byte
	}

	catTestfile()
}

func catTestfile() {
	fmt.Println("*** testfileの中身をcatで表示します ***")
	command := exec.Command("cat", "testfile")
	command.Stdout = os.Stdout
	err := command.Run()
	if err != nil {
		log.Fatal("catの実行に失敗しました")
	}
}
