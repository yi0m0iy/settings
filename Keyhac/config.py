from keyhac import cblister_FixedPhrase
from ckit.ckit_misc import getAppDataPath as getapp
from pyauto import shellExecute
from os.path import join as join_path
import ctypes
import csv
import codecs


def configure(keymap):
    keymap.editor = r"$HOME\AppData\Local\atom\app-1.11.2\atom.exe"
    keymap.setFont("源ノ角ゴシック Code JP L", 12)
    keymap.setTheme("black")

    vim_modifier = 235
    vim_mod_str = "({})".format(vim_modifier)

    keymap.replaceKey("Return", vim_modifier)
    keymap.defineModifier(vim_modifier, "User0")

    def escape_skk_ascii():
        keymap.InputKeyCommand("Escape")()
        wnd = keymap.getTopLevelWindow()
        if (wnd.getImeStatus()):
            keymap.InputKeyCommand("Ctrl-L")()

    keymap_global = keymap.defineWindowKeymap()
    keymap_global["O-LCtrl"]      = "Back"
    keymap_global["O-RCtrl"]      = "Return"
    keymap_global["O-LShift"]     = "Space"
    keymap_global[vim_mod_str]    = escape_skk_ascii

    keymap_global["U0-H"]         = "Left"
    keymap_global["U0-J"]         = "Down"
    keymap_global["U0-K"]         = "Up"
    keymap_global["U0-L"]         = "Right"
    keymap_global["U0-S-H"]       = "W-Left"
    keymap_global["U0-S-J"]       = "W-Down"
    keymap_global["U0-S-K"]       = "W-Up"
    keymap_global["U0-S-L"]       = "W-Right"
    keymap_global["U0-N"]         = "A-Tab"
    keymap_global["U0-P"]         = "A-S-Tab"
    keymap_global["U0-Y"]         = "C-C"
    keymap_global["U0-P"]         = "C-V"

    keymap_global["U0-D"]         = "C-X"
    keymap_global["U0-U"]         = "C-Z"
    keymap_global["U0-Slash"]     = "C-F"
    keymap_global["U0-B"]         = "W-Tab"  # Buffer
    keymap_global["U0-0"]         = "Home"
    keymap_global["U0-S-4"]       = "End"  # $

    keymap_global["U0-C"]         = keymap.command_ClipboardList
    keymap_global["U0-E"]         = eject_win

    def open_cmder():
        shellExecute("open", "cmder.exe", "/single $HOME")

    keymap_global["U0-T"]         = open_cmder  # Terminal
    keymap_global["U0-A"]         = lambda: shellExecute("open", "atom.exe")

    sentence = [
        ("HTML:コメント", "<!-- -->"),
        ("PowerShell:CmdletBinding", "[CmdletBinding()]"),
    ]

    data_path = join_path(getapp(), "Keyhac", "sensitive.csv")
    try:
        with codecs.open(data_path, "r", "utf8") as f:
            reader = csv.reader(f)
            sensitive = [tuple(line) for line in reader]

        keymap.cblisters = [
            ("Person", cblister_FixedPhrase(sensitive)),
            keymap.cblisters[0],
            ("呪文集", cblister_FixedPhrase(sentence)),
        ]
    except FileNotFoundError:
        print("sensitive.csvは発見出来ませんでした")
        keymap.cblisters += [
            ("呪文集", cblister_FixedPhrase(sentence)),
        ]


def eject_win():
    ctypes.windll.WINMM.mciSendStringW("set cdaudio door open", None, 0, None)
