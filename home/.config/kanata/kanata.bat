REM Put under Windows Startup folder: see shell:startup after WinKey+R
REM https://github.com/jtroo/kanata/discussions/193#discussioncomment-13874595
START /MIN /HIGH conhost --headless kanata -c %UserProfile%\.config\kanata\windows.kbd && wmic process where name="kanata.exe" CALL setpriority "high priority"
