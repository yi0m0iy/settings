#!/usr/bin/python
import feedparser as fp
from time import strftime

url = "https://www.archlinuxjp.org/feeds/news.xml"
number = 5
date_fmt = "%Y/%m/%d"

def format_updated(entry):
    return strftime(date_fmt, entry.updated_parsed)

responce = fp.parse(url)
newers = ["{} {}".format(format_updated(entry), entry.title)
          for entry in responce.entries[:number]]
print(responce.feed.title)
print(*newers, sep="\n")
