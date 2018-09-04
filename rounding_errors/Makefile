PYVER=3.7

CFLAGS=$(shell python$(PYVER)-config --cflags)
CFLAGS+=-I/opt/local/Library/Frameworks/Python.framework/Versions/$(PYVER)/lib/python$(PYVER)/site-packages/numpy/core/include/
CFLAGS+=-I/opt/local/include/
CFLAGS+=-O3

LDFLAGS=$(shell python$(PYVER)-config --ldflags)
LDFLAGS+=-L/opt/local/Library/Frameworks/Python.framework/Versions/$(PYVER)/lib/python$(PYVER)/site-packages/numpy/lib/
LDFLAGS+=-L/opt/local/lib/

all: floatingPointSim.so

floatingPointSim.c: floatingPointSim.pyx
	cython-$(PYVER) floatingPointSim.pyx

floatingPointSim.so: floatingPointSim.c
	clang -w --shared $(CFLAGS) $(LDFLAGS) -o floatingPointSim.so floatingPointSim.c

clean:
	rm -rf *.so *.so.* *.c
