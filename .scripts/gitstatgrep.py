#!/usr/bin/python3

"""
git status change types
-m: modified
-!m: unmodified
-s: staged
-a: added
-t: tracked
-!t: untracked

"""

__author__ = 'Michael Belousov'

import subprocess as subproc
from argparse import ArgumentParser as ArgParse
from typing import Dict, List, Any, cast
import os

change_types = {
    'M': 'modified',
    'A': 'added',
    'D': 'deleted',
    'R': 'renamed',
    '?': 'untracked',
    ' ': None
    }

ChangeData = Dict[os.path.abspath, 
        Dict({
            'change': change_types.values(),
            'is_staged': bool
        })
    ]

def parseStatus(status: str) -> Dict[os.path.abspath, Any]:
    """parse a git status output string to a queryable structure"""
    attrs = {}
    for line in status.split('\n'):
        # set staged to be if the first character holds the change type
        staged      = line[0] not in (' ', '?')
        change      = change_types(line[0 if staged else 1])
        path        = line[2:].strip()
        attrs[path] = {
            'change': change,
            'is_staged': is_staged
        }
    return attrs

if __name__ == '__main__':
    # TODO: use stream
    out = subproc.check_output('git status --porcelain')
    stat = parseStatus(out)
    print(out)


