GroupAdd("default_browser", "ahk_exe firefox.exe")
GroupAdd("editor", "ahk_exe sublime_text.exe")
GroupAdd("terminal", "ahk_exe wezterm-gui.exe")
GroupAdd("terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("ide", "ahk_exe phpstorm64.exe")
GroupAdd("development_browser", "ahk_exe chrome.exe")
GroupAdd("communication", "ahk_exe OUTLOOK.EXE")
GroupAdd("communication", "ahk_exe ms-teams.exe")
GroupAdd("sql", "ahk_exe heidisql.exe")
GroupAdd("todo", "ahk_exe Everdo.exe")
GroupAdd("documents", "ahk_exe explorer.exe")

<!a:: GroupActivate("default_browser", "R")
<!s:: GroupActivate("editor", "R")
<!d:: GroupActivate("terminal", "R")
<!f:: GroupActivate("ide", "R")
<!g:: GroupActivate("development_browser", "R")
<!q:: GroupActivate("communication", "R")
<!w:: GroupActivate("sql", "R")
<!e:: GroupActivate("todo", "R")
<!r:: GroupActivate("documents", "R")