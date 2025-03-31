print(">>>> ipython startup >>>>")
import IPython

ipython = IPython.get_ipython()
if ipython is not None:
    ipython_version = IPython.__version__
    major_version = int(ipython_version.split(".")[0])
    minor_version = int(ipython_version.split(".")[1])

    if major_version < 8 or (major_version == 8 and minor_version < 1):
        ipython.magic("load_ext autoreload")
        ipython.magic("autoreload 2")
    else:
        ipython.run_line_magic(magic_name="load_ext", line="autoreload")
        ipython.run_line_magic(magic_name="autoreload", line="2")

    print("Autoreload enabled.")
else:
    print("Autoreload not enabled.")

# aliases
q = exit

# imports
_imports = [
    "import numpy as np",
    "import pandas as pd",
    "import polars as pl",
    "import matplotlib.pyplot as plt",
    "from pathlib import Path",
]
for _statement in _imports:
    try:
        exec(_statement)  # pylint: disable=exec-used
        print(f"{_statement}")
    except ImportError:
        print(f"Couldn't {_statement}")


# helpers
def __randpd(rows=10, cols=3, dtypes=None):
    import random  # pylint: disable=import-outside-toplevel

    try:
        import pandas as pd  # pylint: disable=import-outside-toplevel
    except ImportError:
        print("Couldn't import pandas")
        return

    n_rows, rows = (len(rows), rows) if isinstance(rows, list) else (rows, None)
    n_cols, cols = (len(cols), cols) if isinstance(cols, list) else (cols, None)

    if dtypes is None:
        dtypes = float
    if not isinstance(dtypes, list):
        dtypes = [dtypes]
    if not len(dtypes) == n_cols:
        dtypes = [dtypes[0] for _ in range(n_cols)]

    mockval = {
        str(float): lambda: random.uniform(0, 1),
        str(int): lambda: random.randint(0, 10),
        str(str): lambda: random.choice(["qwe", "asd", "zxc"]),
    }

    for j in range(n_cols):
        if str(dtypes[j]) not in mockval:
            print(f"{dtypes[j]} not supported, setting to float.")
            dtypes[j] = float

    data = [
        [mockval[str(dtypes[j])]() for j in range(n_cols)]
        for _ in range(n_rows)
    ]
    return pd.DataFrame(data, index=rows, columns=cols)


def __randpl(rows=10, cols=3, dtypes=None):
    try:
        import polars as pl  # pylint: disable=import-outside-toplevel
    except ImportError:
        print("Couldn't import polars")
        return
    return pl.DataFrame(__randpd(rows, cols, dtypes))


print("<<<< ipython startup <<<<")
