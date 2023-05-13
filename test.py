# int compression level
import pyzstd as zstd
import sys
import os
import textract
import pickle

#
#import docx2txt
#data = textract.process("/home/user/Desktop/AdaptiveDataCompression/Data/single/large/large.doc")
#msg=data.read()
file=open("/home/user/Desktop/AdaptiveDataCompression/Data/single/large/large.doc","r")
dat=file.read()
file.close()
data=pickle.dumps(dat)
print(sys.getsizeof(data))
#data=data.encode("utf8")
#print(sys.getsizeof(msg))
print(type(data))
compressed_dat = zstd.compress(data, 10)
print(type(compressed_dat))
print(sys.getsizeof(compressed_dat))
decompressed_dat=zstd.decompress(compressed_dat)
print(sys.getsizeof(decompressed_dat))
file=open("new2.doc","wb")
file.write(decompressed_dat)
file.close()
# dict option, use 6 threads to compress, and append a 4-byte checksum.



