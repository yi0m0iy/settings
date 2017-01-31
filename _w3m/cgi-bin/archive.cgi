#!/usr/bin/python
import os

w3m_url = os.environ["W3M_URL"]
#get the oldest archive
endpoint = "http://web.archive.org/web/1/"
uri = f"{endpoint}{w3m_url}"
print(f"""Content-Type: text/plain
W3m-control: GOTO {uri}
W3m-control: DELETE_PREVBUF
""")
