#!/usr/bin/python3

import os
import sys
import glob

nr = int(sys.argv[1]) if len(sys.argv) > 1 else 11
roots = glob.glob('/media/{}/*/'.format(os.environ.get('USER', 'root')))

if not roots:
    print("ERROR: can't find anything inside /media/martijn")
    sys.exit()
root = roots[0]

for d, sub_dirs, filenames in os.walk('templates'):
    for filename in filenames:
        d_template = d.replace('templates/', '')
        source = os.path.join(d, filename)
        destination = os.path.join(root, d_template, filename)
        print(root, source, destination)
        with open(source, 'r') as fp:
            contents = fp.read()
            contents = contents.format(NR=nr, NR_HUNDRED=100+nr)
        with open(destination, 'w') as fp:
            print("WRITING", destination, ":")
            print(contents)
            #fp.write(contents)
