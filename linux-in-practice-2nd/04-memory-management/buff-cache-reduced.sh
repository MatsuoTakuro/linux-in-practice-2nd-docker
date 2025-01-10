#!/bin/bash

echo "ファイル作成前のシステム全体のメモリ使用量を表示します。"
free

echo "100MBのファイルを新規作成します。これによってカーネルはメモリ上に100MBのページキャッシュ領域を獲得します。"
dd if=/dev/zero of=testfile bs=1M count=100

echo "ページキャッシュ獲得後のシステム全体のメモリ使用量を表示します。"
free

echo "ファイル削除後、つまりページキャッシュ削除後のシステム全体のメモリ使用量を表示します。"
rm testfile
free
