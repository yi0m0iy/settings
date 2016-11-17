from keyhac import cblister_FixedPhrase
from ckit.ckit_misc import getAppDataPath as getapp
from os.path import join as join_path
import ctypes
import csv
import codecs


def configure(keymap):
    keymap.editor = r"$HOME\AppData\Local\atom\app-1.11.2\atom.exe"
    keymap.setFont("源ノ角ゴシック Code JP L", 12)
    keymap.setTheme("black")

    keymap.replaceKey("Space", "LShift")
    keymap.replaceKey("Return", 235)
    keymap.replaceKey(242, "Return")
    keymap.replaceKey(29, "Back")
    keymap.defineModifier(235, "User0")

    keymap_global = keymap.defineWindowKeymap()
    keymap_global["O-LCtrl"]      = "Escape"
    keymap_global["O-LShift"]     = "Space"
    keymap_global["U0-W"]         = "Up"
    keymap_global["U0-S"]         = "Down"
    keymap_global["U0-A"]         = "Left"
    keymap_global["U0-D"]         = "Right"
    keymap_global["U0-W-W"]       = "W-Up"
    keymap_global["U0-W-S"]       = "W-Down"
    keymap_global["U0-W-A"]       = "W-Left"
    keymap_global["U0-W-D"]       = "W-Right"
    keymap_global["U0-0"]         = "Home"
    keymap_global["U0-4"]         = "End"
    keymap_global["U0-C"]         = keymap.command_ClipboardList
    keymap_global["U0-E"]         = eject_win
    keymap_global["RW-Back"]       = "Delete"

    keymap_atom = keymap.defineWindowKeymap(
        exe_name="atom.exe",
        class_name="Chrome_WidgetWin_1"
    )
    keymap_atom["O-LCtrl"] = "Escape", "L"

    data_path = join_path(getapp(), "Keyhac", "sensitive.csv")
    with codecs.open(data_path, "r", "utf8") as f:
        reader = csv.reader(f)
        sensitive = [tuple(line) for line in reader]

    sentence = [
        ("HTML:コメント", "<!-- -->"),
        ("PowerShell:CmdletBinding", "[CmdletBinding()]"),
    ]

    keymap.cblisters = [
        ("Person", cblister_FixedPhrase(sensitive)),
        keymap.cblisters[0],
        ("呪文集", cblister_FixedPhrase(sentence)),
    ]


def eject_win():
    ctypes.windll.WINMM.mciSendStringW("set cdaudio door open", None, 0, None)
