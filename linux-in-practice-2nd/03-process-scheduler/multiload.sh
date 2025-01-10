#!/bin/bash

MULTICPU=0
PROGNAME=$0
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

usage() {
    exec >&2
    echo "使い方: $PROGNAME [-m] <プロセス数>
    所定の時間動作する負荷処理プロセスを<プロセス数>で指定した数だけ動作させて、すべての終了を待ちます。
    各プロセスにかかった時間を出力します。
    デフォルトではすべてのプロセスは1論理CPU上でだけ動作します。

オプションの意味:
    -m: 各プロセスを複数CPU上で動かせるようにします。"
    exit 1
}

# getopts command parses positional parameters to command-line options.
while getopts "m" OPT ; do # get only -m option (without value)
    case $OPT in
        m) # if the option is -m,
            MULTICPU=1
            ;;
        \?) # if an invalid option is passed,
            usage
            ;;
    esac
done

# shift command moves the command line arguments one step to the left.
# $1 (-m) is removed from the command line arguments and $2 (<プロセス数>) becomes $1.
shift $((OPTIND - 1))

if [ $# -lt 1 ] ; then
    usage
fi

CONCURRENCY=$1

if [ $MULTICPU -eq 0 ] ; then
    # 負荷処理をCPU0でのみ実行できるようにします
    # taskset command sets or retrieves the CPU affinity of a running process given its PID
    # or launches a new command with a given CPU affinity.
    taskset -p -c 0 $$ >/dev/null
fi

for ((i=0;i<CONCURRENCY;i++)) do
   # time command is used to measure the time taken by the script to execute and print the real, user, and sys time.
    time "${SCRIPT_DIR}/load.py" &
done

for ((i=0;i<CONCURRENCY;i++)) do
    # wait command waits for all child processes in the background to finish
    # but why is wait called multiple times?
    wait
done
