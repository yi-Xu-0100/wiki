@echo off

CHOICE /C YNC /M "�Ƿ�ִ��simiki g��ȷ���밴 Y���񲢼����밴 N������ȡ���밴 C��"
if errorlevel 3 goto :end 
if errorlevel 2 goto :cdoutput 
if errorlevel 1 goto :simiki

:simiki
@echo on
simiki g
@echo off
echo  /**********************"simiki g finish,����Ϊcd output ��ִ��git add������"****************************/
@echo off

:cdoutput
cd output
git add .
@echo on
git status
@echo off
CHOICE /C YN /M "�Ƿ�ִ��git commit��ȷ���밴 Y��ȡ���밴 N��"
if errorlevel 2 goto :end
if errorlevel 1 goto :gitcommit

:gitcommit
set /p CommitMessages=������"commit massage":
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