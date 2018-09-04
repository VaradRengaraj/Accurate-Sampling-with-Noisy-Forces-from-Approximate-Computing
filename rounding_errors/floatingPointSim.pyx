import numpy as np
cimport numpy as np
from libc.stdint cimport uint64_t

DTYPE = np.float64
ctypedef np.float64_t DTYPE_t
ctypedef uint64_t DTYPE_int_t

cdef DTYPE_int_t mantissaMask = 0x000FFFFFFFFFFFFF;
cdef DTYPE_int_t exponentMask = 0x7FF0000000000000;
cdef DTYPE_int_t signMask     = 0x8000000000000000;

cdef DTYPE_int_t bitmasks[53]
bitmasks[:] = [
  0xFFF0000000000000,
  0xFFF8000000000000,
  0xFFFC000000000000,
  0xFFFE000000000000,
  0xFFFF000000000000,
  0xFFFF800000000000,
  0xFFFFC00000000000,
  0xFFFFE00000000000,
  0xFFFFF00000000000,
  0xFFFFF80000000000,
  0xFFFFFC0000000000,
  0xFFFFFE0000000000,
  0xFFFFFF0000000000,
  0xFFFFFF8000000000,
  0xFFFFFFC000000000,
  0xFFFFFFE000000000,
  0xFFFFFFF000000000,
  0xFFFFFFF800000000,
  0xFFFFFFFC00000000,
  0xFFFFFFFE00000000,
  0xFFFFFFFF00000000,
  0xFFFFFFFF80000000,
  0xFFFFFFFFC0000000,
  0xFFFFFFFFE0000000,
  0xFFFFFFFFF0000000,
  0xFFFFFFFFF8000000,
  0xFFFFFFFFFC000000,
  0xFFFFFFFFFE000000,
  0xFFFFFFFFFF000000,
  0xFFFFFFFFFF800000,
  0xFFFFFFFFFFC00000,
  0xFFFFFFFFFFE00000,
  0xFFFFFFFFFFF00000,
  0xFFFFFFFFFFF80000,
  0xFFFFFFFFFFFC0000,
  0xFFFFFFFFFFFE0000,
  0xFFFFFFFFFFFF0000,
  0xFFFFFFFFFFFF8000,
  0xFFFFFFFFFFFFC000,
  0xFFFFFFFFFFFFE000,
  0xFFFFFFFFFFFFF000,
  0xFFFFFFFFFFFFF800,
  0xFFFFFFFFFFFFFC00,
  0xFFFFFFFFFFFFFE00,
  0xFFFFFFFFFFFFFF00,
  0xFFFFFFFFFFFFFF80,
  0xFFFFFFFFFFFFFFC0,
  0xFFFFFFFFFFFFFFE0,
  0xFFFFFFFFFFFFFFF0,
  0xFFFFFFFFFFFFFFF8,
  0xFFFFFFFFFFFFFFFC,
  0xFFFFFFFFFFFFFFFE,
  0xFFFFFFFFFFFFFFFF,
]

def roundToZero(DTYPE_t val, int mantissaBits):
  cdef DTYPE_int_t *ptr = <DTYPE_int_t *> &val
  ptr[0] &= bitmasks[mantissaBits]
  return val

def roundToInfinity(DTYPE_t val, int mantissaBits):
  cdef DTYPE_int_t *ptr = <DTYPE_int_t *> &val
  cdef int exponent = ((ptr[0] & exponentMask) >> 52) - 1023
  cdef DTYPE_int_t cutoff = ptr[0] & ~bitmasks[mantissaBits]
  ptr[0] &= bitmasks[mantissaBits]
  if (cutoff == 0):
    return val
  if (val > 0):
    val += pow(2.0, exponent-mantissaBits)
  else:
    val -= pow(2.0, exponent-mantissaBits)
  return val

def roundUp(DTYPE_t val, int mantissaBits):
  if (val > 0):
    return roundToInfinity(val, mantissaBits)
  else:
    return roundToZero(val, mantissaBits)

def roundDown(DTYPE_t val, int mantissaBits):
  if (val < 0):
    return roundToInfinity(val, mantissaBits)
  else:
    return roundToZero(val, mantissaBits)

def roundToNearest(DTYPE_t val, int mantissaBits):
  cdef DTYPE_t a = roundToZero(val, mantissaBits)
  cdef DTYPE_t b = roundToInfinity(val, mantissaBits)
  cdef DTYPE_t a_err = abs(val - a)
  cdef DTYPE_t b_err = abs(val - b)
  cdef DTYPE_int_t *ptr = <DTYPE_int_t *> &a
  if (a_err < b_err):
    return a
  elif (b_err < a_err):
    return b
  else:
    if ((ptr[0] >> (52-mantissaBits)) & 1 == 0):
      return a
    else:
      return b
