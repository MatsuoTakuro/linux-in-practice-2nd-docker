#!/usr/bin/python3

import subprocess

# 適当な量のデータを作成してメモリを獲得します。
# メモリ容量が少ないシステムではプログラムがメモリ不足で失敗する可能性があります。
# その場合はsizeの値を小さくして再実行してください。
size = 10000000

print("メモリ獲得前のシステム全体のメモリ使用量を表示します。")
subprocess.run("free")

# [0]*size は、要素が0でsize個のリストを作成します。
array = [0]*size

print("メモリ獲得後のシステム全体のメモリ空き容量を表示します。")
subprocess.run("free")
