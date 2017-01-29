#!/usr/bin/python
import os

query = os.environ["QUERY_STRING"]
if query[:3] == "ttp":
    uri = f"h{query}"
elif query[:2] == "tp":
    uri = f"ht{query}"
else:
    uri = "https://google.co.jp"

print(f"""Content-Type: text/plain
W3m-control: GOTO {uri}
W3m-control: DELETE_PREVBUF
""")
