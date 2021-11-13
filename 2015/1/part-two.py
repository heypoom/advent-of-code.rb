#!/usr/bin/env python3

with open('input', 'r+') as f:
    content = f.read()
    floor = 0

    for idx, char in enumerate(content):
        floor = floor + (1 if char == '(' else -1)

        if floor < 0:
            print(idx)
            exit()
