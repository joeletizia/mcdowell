def top_n(collection, n):
    s = Set()
    for item in collection:
        if len(s) < n:
            s.add(item)
        else:
            min = set_min(s)
            if item > min:
                s.remove(min)
                s.add(item)
    return list(s)

def set_min(s):
    x = list(s)
    x.sort()
    return x[0]
