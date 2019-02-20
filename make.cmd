
call ant -f make\build.xml

pause

:call make\make.log

call target\openctf\docs\html\index.html

:pause