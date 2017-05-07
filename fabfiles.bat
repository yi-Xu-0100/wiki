@echo off

simiki g
cd output
git add .
@echo on
git status
@echo off
CHOICE /C YN /M "是否执行git commit，确认请按 Y，取消请按 N。"
if errorlevel 2 goto :end
if errorlevel 1 goto :gitcommit

:gitcommit
@echo on
git commit -m "%date%"
git push origin coding-pages
@echo off
git checkout gh-pages
cd ..
simiki g
cd output
git add .
@echo on
git commit -m "%date%"
git push origin gh-pages
@echo off
git checkout coding-pages
cd ..

:end
pause