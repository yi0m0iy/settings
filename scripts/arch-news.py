#!/usr/bin/python
from feedparser import parse as feedparse
from dateparser import parse as dateparse

url = "https://www.archlinuxjp.org/feeds/news.xml"
date_fmt = "%Y/%m/%d"

def get_last_reboot():
    import subprocess
    log = subprocess.getoutput("last reboot --time-format iso")
    newest_boot = log.split("\n")[0].split()[4]
    reboot_time = dateparse(newest_boot)
    if reboot_time.year == 1970:
        newest_halt = log.split("\n")[1].split()[5]
        reboot_time = dateparse(newest_halt)
    return reboot_time

last_reboot = get_last_reboot()
responce = feedparse(url)
newer_entries = [f"{dateparse(entry.updated).strftime(date_fmt)} {entry.title}"
                 for entry in responce.entries
                 if dateparse(entry.updated) > last_reboot]

if newer_entries:
    print(responce.feed.title)
    print(*newer_entries, sep="\n")
