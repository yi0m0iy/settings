#!/usr/bin/python
import os


def getquery(params: dict):
    return "&".join(f"{k}={v}" for k, v in params.items())


query = os.environ["QUERY_STRING"].split(":")
prefix, body = query[0], ":".join(query[1:])
if prefix in ["g", "google"]:
    endpoint = "https://google.co.jp/search"
    params = {
        "ie": "UTF-8",
        "oe": "UTF-8",
        "q":  body
    }
elif prefix in ["p", "python"]:
    endpoint = "https://google.co.jp/search"
    params = {
        "ie": "UTF-8",
        "oe": "UTF-8",
        "q":  f"{body} site:docs.python.jp/3/"
    }
elif prefix in ["a", "arch"]:
    endpoint = "https://wiki.archlinuxjp.org/index.php"
    params = {
        "search": body
    }
elif prefix in ["y", "youtube"]:
    endpoint = "https://youtube.com/results"
    params = {
        "search_query": body
    }
else:
    endpoint = "https://google.co.jp"
    params = {
        "ie": "UTF-8",
        "oe": "UTF-8"
    }

uri = f"{endpoint}?{getquery(params)}"
print(f"""Content-Type: text/plain
W3m-control: GOTO {uri}
W3m-control: DELETE_PREVBUF
""")
