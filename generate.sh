#!/bin/bash

#time=60
#name=$1
#loopfile="/home/user/Desktop/AdaptiveDataCompression/Data/single/loopfiles/"

sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'
#sudo free -m  && sync && echo 3 > /proc/sys/vm/drop_caches && free -m

#sudo sar -u ALL 1 > report.txt &
#sudo sar -r 1 > mem.txt &



#python3 /home/user/pyzstdDemo.py
#python3 /home/user/MT_test.py
python3 /home/user/Desktop/AdaptiveDataCompression/pyzstd/test.py
#python3 /home/user/Desktop/AdaptiveDataCompression/pyzstd/testrich.py
#/home/user/Desktop/AdaptiveDataCompression/Src/zstd/examples/streaming_compression $1 5 1


#for d in *
#do
#sudo perf record -a -F 99 -g ../../../Src/zstd/zstd -5 $d
#sudo perf script > perf.script
#/home/user/Desktop/AdaptiveDataCompression/Src/zstd/zstd $d -5
#done
#../../../Src/FlameGraph/stackcollapse-perf.pl perf.script | ../../../Src/FlameGraph/flamegraph.pl > flamegraph.svg

#sleep $time
#sed 's/ \+/,/g' mem.txt > mem.csv 
#sed 's/ \+/,/g' report.txt > report.csv 

sudo ps aux | grep -e "sar" | awk {'print $2'} | xargs kill -9




