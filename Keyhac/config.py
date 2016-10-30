import sys
import os
import datetime

import pyauto
from keyhac import *


def configure(keymap):
    keymap.editor = r"C:\Users\yi0m0iy\AppData\Local\atom\app-1.11.2\atom.exe"
    keymap.setFont( "Noto Sans CJK JP", 12 )
    keymap.setTheme("black")

    keymap.replaceKey("Space", "LShift")
    keymap_global = keymap.defineWindowKeymap()
    keymap_global["O-LCtrl"]  = "Escape"
    keymap_global["O-LShift"] = "Space"
    keymap_global["(242)"]    = "Return"
    keymap_global["(29)"]     = "Backspace"

    keymap_atom = keymap.defineWindowKeymap(
        exe_name="atom.exe",
        class_name="Chrome_WidgetWin_1"
    )
    keymap_atom["O-LCtrl"] = "Escape", "L"
