# linux-in-practice-2nd-docker

This repo is for building a Docker environment for learning the book `Linuxのしくみ【増補改訂版】` on M1 Mac.

- Book
  - [［試して理解］Linuxのしくみ ―実験と図解で学ぶOS、仮想マシン、コンテナの基礎知識【増補改訂版】](https://gihyo.jp/book/2022/978-4-297-13148-7)
- Experiment code
  - [linux-in-practice-2nd](https://github.com/satoru-takeuchi/linux-in-practice-2nd)
- Author's support page (Errata, etc.)
  - [linuxのしくみ増補改訂版のサポート用](https://docs.google.com/spreadsheets/d/1viQfCGdVqVKITk7Z_EhGGTJfz6BjOkQYFOU3LBfmcv4/edit#gid=0)
- Reference
  - [「［試して理解］Linux のしくみ【増補改訂版】」の実験環境を Docker で作成する方法と詰まったこと（M1Mac）](https://zenn.dev/msksgm/articles/20230814-linux-in-practice-2nd-docker)
  - [Docker を使った [試して理解] Linuxの仕組みの為の環境構築](https://qiita.com/ken__8/items/19572e28d63091c1a8b9)

## Usage

- You can use Makefile to build and run the Docker environment.

### Build

- FYI, it took about 5 minutes for my machine to build the Docker image first. (Although it was so long...)
- After that, it usually takes few seconds to do that thanks to caching.
- The size of the Docker image is about 1.7GB.

```bash
make build
# Omit the output of the build process...
```

### Run

```bash
❯ make run
docker run -it -p 5050:5050 -v /your/local/path/linux-in-practice-2nd-docker:/linux-in-practice-2nd/bind-mounts linux-in-practice-2nd-docker /bin/bash
root@934ea3fc9292:/linux-in-practice-2nd# ls -la
total 60
drwxr-xr-x 1 root root 4096 Jan  7 09:40 .
drwxr-xr-x 1 root root 4096 Jan  7 09:40 ..
drwxr-xr-x 8 root root 4096 Jan  7 05:37 .git
drwxr-xr-x 2 root root 4096 Jan  7 05:37 01-operating-system-overview
drwxr-xr-x 2 root root 4096 Jan  7 05:37 02-process-management-1
drwxr-xr-x 2 root root 4096 Jan  7 05:37 03-process-scheduler
drwxr-xr-x 2 root root 4096 Jan  7 05:37 04-memory-management
drwxr-xr-x 2 root root 4096 Jan  7 05:37 05-process-management-2
drwxr-xr-x 2 root root 4096 Jan  7 05:37 07-filesystem
drwxr-xr-x 2 root root 4096 Jan  7 05:37 08-storage-hierarchy
drwxr-xr-x 4 root root 4096 Jan  7 05:37 09-block-layer
drwxr-xr-x 3 root root 4096 Jan  7 05:37 10-virtualization
drwxr-xr-x 2 root root 4096 Jan  7 05:37 12-cgroups
-rw-r--r-- 1 root root 1072 Jan  7 05:37 LICENSE
-rw-r--r-- 1 root root  681 Jan  7 05:37 README.md
drwxr-xr-x 6 root root  192 Jan  7 09:37 bind-mounts
```
