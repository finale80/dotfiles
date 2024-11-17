import itertools
import os
import requests

import pandas as pd
import polars as pl


def func1():
    for i in range(10):
        i += 1
        print(i)


def func2():
    print()
    for idx in range(10):
        print(idx)


if __name__ == "__main__":
    func1()
    func2()
