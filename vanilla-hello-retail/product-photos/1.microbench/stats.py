#!/usr/bin/python

import sys

def main():
    f = open(sys.argv[1], "r")
    s1 = 0.0
    n1 = 0.0
    s = f.readlines()
    for line in s:
        l = line.strip("\n")
        p = float(l[:-1])
        if p < 5.00:
            s1 += p
            n1 += 1
    print ("Avg: %f" % (s1 / n1))

if __name__ == "__main__":
    main()
