#!/usr/bin/env python
"""
due.py
Python 2/3 script for todo.txt add-on
Created by Rebecca Morgan 2017-03-10
Copyright (c) 2017 Rebecca Morgan. All rights reserved.

Edits by Steve Winslow 2017-06-25
Edits copyright (c) 2017 Steve Winslow. Licensed under MIT.
"""

from __future__ import print_function
from __future__ import division

import os
import sys
import math
from datetime import datetime, timedelta
import re


def main(N_days):
    date_next_N_days = datetime.now() + timedelta(days=N_days)
    print(date_next_N_days.date()); 

if __name__ == "__main__":
    main(int(sys.argv[1]))
