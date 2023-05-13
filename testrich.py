import tarfile
import sys
import pyzstd as zstd

import contextlib
import io

import tempfile
from pyzstd import decompress_stream
# when using read mode (decompression), the level_or_option parameter
# can only be a dict object, that represents decompression option. It
# doesn't support int type compression level in this case.

class ZstdTarFile(tarfile.TarFile):
    def __init__(self, name, mode='r', *, level_or_option=None, zstd_dict=None, **kwargs):
        self.zstd_file = zstd.ZstdFile(name, mode,level_or_option=level_or_option,zstd_dict=zstd_dict)
        try:
            super().__init__(fileobj=self.zstd_file, mode=mode, **kwargs)
        except:
            self.zstd_file.close()
            raise

    def close(self):
        try:
            super().close()
        finally:
            self.zstd_file.close()

# write .tar.zst file (compression)
with ZstdTarFile('c10.tar.zst', mode='w', level_or_option=5) as tar:
    # do something
    print(sys.getsizeof(tar))
# read .tar.zst file (decompression)
#with ZstdTarFile('c10.tar', mode='r') as tar:
    # do something
#    print(sys.getsizeof(tar))

@contextlib.contextmanager
def ZstdTarReader(name, *, zstd_dict=None, option=None, **kwargs):
    with io.open(name, 'rb') as ifh:
        with tempfile.TemporaryFile() as tmp_file:
            decompress_stream(ifh, tmp_file,
                              zstd_dict=zstd_dict, option=option)
            tmp_file.seek(0)
            with tarfile.TarFile(fileobj=tmp_file, **kwargs) as tar:
                yield tar

with ZstdTarReader('c10.tar.zst') as tar:
	print(sys.getsizeof(tar))
