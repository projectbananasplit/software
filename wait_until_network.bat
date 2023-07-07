:ping
ping 8.8.4.4 -n 1 -w 1000 > nul
set target=maker-space.de
ping %target% -n 1 | find "TTL="
if errorlevel==1 goto ping
