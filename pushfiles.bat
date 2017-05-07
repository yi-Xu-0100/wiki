@echo off

CHOICE /C YNC /M "是否执行simiki g，确认请按 Y，否并继续请按 N，或者取消请按 C。"
if errorlevel 3 goto :end 
if errorlevel 2 goto :cdoutput 
if errorlevel 1 goto :simiki

:simiki
@echo on
simiki g
@echo off
echo  /**********************"simiki g finish,以下为cd output 后执行git add的内容"****************************/
@echo off

:cdoutput
cd output
git add .
@echo on
git status
@echo off
CHOICE /C YN /M "是否执行git commit，确认请按 Y，取消请按 N。"
if errorlevel 2 goto :end
if errorlevel 1 goto :gitcommit

:gitcommit
set /p CommitMessages=请输入"commit massage":
@echo on
git commit -m "%CommitMessages%"

git push origin coding-pages
@echo off
git checkout gh-pages
cd ..
simiki g
cd output
git add .
@echo on
git commit -m "%CommitMessages%"
git push origin gh-pages
@echo off
git checkout coding-pages
cd ..

:end
pause