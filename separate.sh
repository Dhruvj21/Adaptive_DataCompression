#!/bin/bash

cd /data/edrm-raw

array=( ASC
asf
asp
au
aux
avi
AVI
bat
BAT
blk
bmp
Bmp
BMP
c
C
cer
cnt
CNT
COM
CRD
css
csv
CSV
ctg
d
D
dat
DAT
db
DB
dbf
dec
DIZ
dll
DLL
Doc
DOC
dot
dtd
DTF
dwf
dwg
DWG
efx
emz
env
ER1
exe
EXE
ful
gif
GIF
gir
h
H
HLP
ht
htm
Htm
HTM
html
HTML
ica
ics
ini
jar
jpe
jpeg
jpg
JPG
js
kob
kof
lnk
LNK
LOG
lst
lwp
m3u
max
mdb
MDB
mem
mht
mid
MIS
mov
mp3
MP3
mpa
mpe
MPE
mpeg
MPEG
mpg
MPG
mpp
mso
n01
n02
nrl
nsf
NTP
 NY9313
NYW
opx
OPX
OVR
p12
pcx
PCX
pDF
PDF
pfx
PIF
pl
png
pps
ppS
PPS
ppt
PPT
prn
ps
psc
pub
pwd
qalhat
qt
RA-ATT
ram
RED
reg
rep
rm
rmx
rpt
rtf
RTF
run
SC2
scr
snp
sql
SQL
swf
tex
tif
Tif
TIF
tiff
tmb
tmp
tsv
ttf
TTF
TXT
unk
url
URL
V1
vcf
vcs
vsd
VSD
W01
wav
WAV
wbk
WFP
WK4
wmf
wmv
WMV
wmz
wpd
WPD
WPJ
wps
WW6
x
xif
XIF
xla
xlk
xll
XLS
xlt
XLT
xlw
XLW
xnk
zip
ZIP
zl9
zlt
doc
eml
pdf
txt
xls
xml
 )

array1=(doc eml pdf txt xls)

array2=( xml )

#for str in ${array1[@]}; do
 #        mkdir ../edrm-new/$str
  #       echo $str
#done


for dir in ./*/ ; do
	echo $dir

	for str in ${array2[@]}; do
  		echo $str
		find $dir -name "*.$str" -exec mv --target-directory=../edrm-new/$str '{}' +
	done





	#mv $dir*.txt ../edrm-sort/txt
	#mv $dir*.xml ../edrm-sort/xml
	#mv $dir*.pdf ../edrm-sort/pdf
	#mv $dir*.eml ../edrm-sort/eml
	#mv $dir*.doc ../edrm-sort/doc

#	find $dir -name "*.eml" -exec mv --target-directory=../edrm-sort/eml '{}' +
#	find $dir -name "*.doc" -exec mv --target-directory=../edrm-sort/doc '{}' +
#	find $dir -name "*.xls" -exec mv --target-directory=../edrm-sort/xls '{}' + 
#	find $dir -name "*.pdf" -exec mv --target-directory=../edrm-sort/pdf '{}' +
#	find $dir -name "*.txt" -exec mv --target-directory=../edrm-sort/txt '{}' + 
done  


	
