#!/bin/bash

for d in 1 2 3
do
   ../../../Scripts/generate.sh & 
   sudo sar -u ALL 1 > /home/user/Desktop/pyzstd_mt/l22/1t/report$d.txt &
   sudo sar -r 1 > /home/user/Desktop/pyzstd_mt/l22/1t/mem$d.txt 
   sleep 20
    
done




