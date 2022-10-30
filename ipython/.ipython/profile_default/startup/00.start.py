from typing import List, Union

def __randdf(rows: Union[int, List[str]] = 10, cols : Union[int, List[str]] = 3):
    try:
        import pandas as pd
        import numpy as np

        n_rows, rows = (len(rows), rows) if isinstance(rows, list) else (rows, None)
        n_cols, cols = (len(cols), cols) if isinstance(cols, list) else (cols, None)

        return pd.DataFrame(np.random.rand(n_rows, n_cols), index=rows, columns=cols)

    except ImportError:
        print("Couldn't import numpy or pandas")


