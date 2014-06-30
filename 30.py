from stemming.porter2 import stem
import sys

for line in sys.stdin:
  strs = line.split()
  if len(strs) > 1:
    print strs[0] + "\t" + strs[1] + "\t" + stem(strs[1])
