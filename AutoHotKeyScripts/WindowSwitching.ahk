GroupAdd("editor", "ahk_exe sublime_text.exe")
GroupAdd("terminal", "ahk_exe wezterm-gui.exe")
GroupAdd("ide", "ahk_exe phpstorm64.exe")
GroupAdd("actions", "ahk_exe Everdo.exe")
GroupAdd("sql", "ahk_exe heidisql.exe")
GroupAdd("working", "ahk_exe chrome.exe")
GroupAdd("mail", "ahk_exe outlook.exe")
GroupAdd("communication", "ahk_exe ms-teams.exe")
GroupAdd("browsing", "ahk_exe firefox.exe")

>!e:: GroupActivate("editor", "R")
>!t:: GroupActivate("terminal", "R")
>!i:: GroupActivate("ide", "R")
>!a:: GroupActivate("actions", "R")
>!s:: GroupActivate("sql", "R")
>!w:: GroupActivate("working", "R")
>!m:: GroupActivate("mail", "R")
>!c:: GroupActivate("communication", "R")
>!b:: GroupActivate("browsing", "R")