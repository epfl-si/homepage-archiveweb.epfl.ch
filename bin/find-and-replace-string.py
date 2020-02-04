#!/usr/bin/env python

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.
# See the LICENSE file for more details.

import os
import sys


def is_file_and_writeable(file):
    return os.path.isfile(file) and os.access(file, os.W_OK)


def replace_string_in_file(old_string, new_string, file):

    if not(is_file_and_writeable):
        print("WARNING: File does not exist or and is not writeable:" + file)
        return

    is_file_updated = False

    # See https://stackoverflow.com/questions/4128144/
    with open(file, 'r') as f:
        newlines = []
        for line in f.readlines():
            if (old_string in line):
                is_file_updated = True
            line = line.replace(old_string, new_string)
            newlines.append(line)

    if is_file_updated:
        print("String Found. Updating File: " + file)
        try:
            with open(file, 'w') as f:
                for line in newlines:
                    f.write(line)
        except:
            print(
                'ERROR: Cannot open/access existing file for writing: ' + file
            )


def find_file_and_replace(old_string, new_string):
    DEFAULT_PATH = '.'
    PATTERNS = ['.html']

    file_list = \
        [os.path.join(dp, f)
            for dp, dn, filenames in os.walk(DEFAULT_PATH)
            for f in filenames
            if os.path.splitext(f)[1] in PATTERNS]

    for current_file in file_list:
        replace_string_in_file(old_string, new_string, current_file)


def usage():
    print('Usage: find-and-replace-string.py old_string new_string\n')
    print('Example:')
    print('  find-and-replace-string.py "epfl-logo.svg" "epfl-logo.png"')


def main():

    if len(sys.argv) < 3:
        usage()
        sys.exit(-1)
    else:
        old_string = sys.argv[1]
        new_string = sys.argv[2]

    find_file_and_replace(old_string, new_string)


main()
