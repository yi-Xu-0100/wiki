@echo off
git add .
git status
CHOICE /c YN /M ȷ��ȷ��Y��ȡ���밴N��
if errorlevel 2 goto :end
if errorlevel 1 goto :commit

:commit
git commit -m "%time%"
ssh -T git@git.coding.net
ssh -T git@github.com
git push origin master

:end
pause