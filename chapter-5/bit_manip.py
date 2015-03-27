def shifter(n, m, i, j):
    base = n >> j + 1
    base = base << (j - i + 1)
    result = base | m
    return result << i

def binary_of_double(double):
    ret = ['.']
    while double > 0:
        r = double * 2
        if r >= 1:
            ret.append('1')
            double = r - 1
        else:
            ret.append('0')
            double = r
    return ''.join(ret)
