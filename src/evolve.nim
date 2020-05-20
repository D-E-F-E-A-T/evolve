#[
-------------------------------------------------------------------------------------
|  Created by Angel Uniminin <uniminin@zoho.com> in 2020 under the terms of AGPLv3  |
|                          Last Updated on 19th May, 2020                           |
-------------------------------------------------------------------------------------
]#

from os import commandLineParams, execShellCmd
from strformat import fmt
from osproc import execProcess

#[
var programName: string = "evolve"
var programVersion: float32 = 0.1
]#
let arguments = commandLineParams()


proc die(c: int, e: string): int =
    if c == 1:
        echo (fmt"Error: {e}")
        quit(1)
    else:
        echo "Unexpected Error!"
        quit(9999)

const help = """
usage: evolve <command> [<args>...]

options:
     -h  :  Show this screen.

commands:
    resolve  :  Install Packages
  autosolve  :  Auto Unmasks Packages (Gentoo Only)
     vanish  :  Uninstall Packages
     search  :  To search for packages
        fly  :  Updates/Upgrades the system's Packages
        add  :  Add/Install repository [paludis & gentoo(layman) only] 
        del  :  Removes/Uninstalls repository [paludis & gentoo(layman) only]
        sync :  Sync all repositories [paludis & gentoo(layman) only]
   
Examples:
    evolve resolve <package-name>
  evolve autosolve <package-name>
     evolve vanish <package-name>
     evolve search <package-name>
        evolve add <repository-name>
        evolve del <repository-name>
        evolve sync
        evolve fly

Supports:
    Yay AUR Helper
    Pacman Package Manager
    Paludis Package Manager
    Portage Package Manager
"""


var unknownArgument: string = ("Unknown Argument! Try: '-h' or '--help' to view instructions")

proc detect_package_manager(program: string): int =
    let 
        output = execProcess(fmt"if command -v {program} >/dev/null; then printf 'True'; fi")
    if output == "True\n":
        return 1
    else:
        discard die(c=9090, "")

var package_manager: string
if detect_package_manager("yay") == 1:
    package_manager = "yay"
elif detect_package_manager("pacman") == 1:
    package_manager = "pacman"
elif detect_package_manager("emerge") == 1:
    package_manager = "portage"
elif detect_package_manager("cave") == 1:
    package_manager = "paludis"
else:
    discard die(c=1, e="Could not find any of Yay, Pacman, Paludis or Portage on this system!")

try:
    case arguments[0]:
    of "-h":
        echo help
    of "resolve":
        case package_manager:
        of "yay":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"yay -S {arg}")
        of "pacman":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"pacman -S {arg}")
        of "portage":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"emerge -aq {arg}")
        of "paludis":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"cave resolve {arg} -x")
        else:
            discard die(c=9090, "")

    of "autosolve":
        case package_manager:
        of "portage":
            discard execShellCmd("emerge -aq --autounmask=y --autounmask-write ; etc-update")
        else:
            discard die(c=9090, "")

    of "vanish":
        case package_manager:
        of "yay":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"yay -R {arg}")
        of "pacman":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"pacman -R {arg}")
        of "portage":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"emerge -aC {arg}")
        of "paludis":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"cave uninstall {arg}")
        else:
            discard die(c=9090, "")

    of "search":
        case package_manager:
        of "yay":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"yay -Ss {arg}")
        of "pacman":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"pacman -Ss {arg}")
        of "portage":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"emerge -S {arg}")
        of "paludis":
            for arg in arguments[1..^1]:
                discard execShellCmd(fmt"cave-search {arg}")
        else:
            discard die(c=9090, "")

    of "fly":
        case package_manager:
        of "yay":
            discard execShellCmd("yay -Syyu")
        of "pacman":
            discard execShellCmd("pacman -Syyu")
        of "portage":
            discard execShellCmd("emerge -quDN @world")
        of "paludis":
            discard execShellCmd("cave resolve world -x")
        else:
            discard die(c=9090, "")
    
    of "add":
        case package_manager:
        of "paludis":
            for arg in arguments[1..^1]:
                discard execShellCmd("cave resolve repository/{arg}")
        of "portage":
            for arg in arguments[1..^1]:
                discard execShellCmd("layman -a {arg}")
        else:
            discard die(c=9090, "")

    of "del":
        case package_manager:
        of "paludis":
            for arg in arguments[1..^1]:
                discard execShellCmd("cave uninstall repository/{arg}")
        of "portage":
            for arg in arguments[1..^1]:
                discard execShellCmd("layman -d {arg}")
        else:
            discard die(c=9090, "")

    of "sync":
        case package_manager:
        of "paludis":
            discard execShellCmd("cave sync")
        of "portage":
            discard execShellCmd("emerge --sync ; layman -S")
        else:
            discard die(c=9090, "")
    else:
        echo unknownArgument
    
except IndexError:
    echo unknownArgument
