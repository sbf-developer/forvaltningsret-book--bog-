#!/usr/bin/env python3
"""Fix Pandoc longtable output for recent LaTeX longtable."""
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
text = text.replace(
    r"{\def\LTcaptype{none} % do not increment counter",
    r"{\def\LTcaptype{table} % do not increment counter",
)
path.write_text(text, encoding="utf-8")
