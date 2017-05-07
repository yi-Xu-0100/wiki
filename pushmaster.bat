@echo off
git add .
git status
CHOICE /c YN /M 确认确按Y，取消请按N。
if errorlevel 2 goto :end
if errorlevel 1 goto :commit

:commit
git commit -m "%time%"
git push origin master

:end
pause