/*

cache

1. 2^2(4)Kバイトから2^2.25(4.76)Kバイト,2^2.5(5.7)Kバイト、...と、最終的には64Mバイトの数値に対して以下の処理をする
  1. 数値に相当するサイズのバッファを獲得
  2. バッファの全キャッシュラインにシーケンシャルにアクセス。最後のキャッシュラインへのアクセスが終わったら
     最初のキャッシュラインに戻り、最終的にはソースコードに書かれているNACCESS回メモリアクセスする
  3. 1回のアクセスあたりの所要時間を記録
2. 1の結果をもとにcache.jpgというファイルにグラフを出力

*/

package main

import (
	"fmt"
	"log"
	"math"
	"os"
	"os/exec"
	"syscall"
	"time"
)

const (
	CACHE_LINE_SIZE = 64 // bytes
	// プログラムがうまく動作しなければこの値を変更してください。高速なマシンではアクセス数が足りずに、
	// とくにバッファサイズが小さいときの値がおかしいことがあります。低速なマシンでは時間がかかりすぎる
	// ことがあるので値を小さくしてください
	// N_ACCESS = 128 * 1024 * 1024 // 128M回のアクセス
	N_ACCESS = 128 * 1024 * 1024 * 10 // 1280M回のアクセス (3分ほどかかる...)
)

func main() {
	_ = os.Remove("out.txt")
	f, err := os.OpenFile("out.txt", os.O_CREATE|os.O_RDWR, 0660)
	if err != nil {
		log.Fatal("openfile()に失敗しました")
	}
	defer f.Close()
	// iの値を2から16まで0.25ずつ増やしていく
	for i := 2.0; i <= 16.0; i += 0.25 {
		bufSize := int(math.Pow(2, i)) * 1024 // KiB (2^i * 1024), total buffer size

		// バッファサイズに相当するメモリ領域を獲得
		data, err := syscall.Mmap(-1, 0, bufSize, syscall.PROT_READ|syscall.PROT_WRITE, syscall.MAP_ANON|syscall.MAP_PRIVATE)
		defer syscall.Munmap(data)
		if err != nil {
			log.Fatal("mmap()に失敗しました")
		}

		fmt.Printf("バッファサイズ 2^%6.2f(%5d) KiB についてのデータを収集中...\n", i, bufSize/1024)
		start := time.Now()
		// バッファの全キャッシュラインにシーケンシャルにアクセス
		for i := 0; i < N_ACCESS/(bufSize/CACHE_LINE_SIZE); i++ {
			// キャッシュラインサイズごとにアクセス
			for j := 0; j < bufSize; j += CACHE_LINE_SIZE {
				data[j] = 0
			}
		}
		end := time.Since(start)
		f.Write([]byte(fmt.Sprintf("%f\t%f\n", i, float64(N_ACCESS)/float64(end.Nanoseconds()))))
	}
	command := exec.Command("./plot-cache.py")
	out, err := command.Output()
	if err != nil {
		fmt.Fprintf(os.Stderr, "コマンド実行に失敗しました: %q: %q", err, string(out))
		os.Exit(1)
	}
}
