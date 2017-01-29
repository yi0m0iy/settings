#!/usr/bin/python
from feedparser import parse as feedparse
from dateparser import parse as dateparse

url = "https://www.archlinuxjp.org/feeds/news.xml"
date_fmt = "%Y/%m/%d"

def get_last_reboot():
    import subprocess
    log = subprocess.getoutput("last reboot --time-format iso")
    last_login = log.split("\n")[0].split()[4]
    return dateparse(last_login)

last_reboot = get_last_reboot()
responce = feedparse(url)
newer_entries = [f"{dateparse(entry.updated).strftime(date_fmt)} {entry.title}"
                 for entry in responce.entries
                 if dateparse(entry.updated) > last_reboot]

if newer_entries:
    print(responce.feed.title)
    print(*newer_entries, sep="\n")
