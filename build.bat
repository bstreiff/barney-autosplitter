@echo off

set WD=%~dp0
del "out\barney.vas" "out\barney.zip"
mkdir out
cd src
"C:\Program Files\7-Zip\7z.exe" a "../out/barney.zip" . ../LICENSE
cd ..\out
ren barney.zip barney.vas
cd ..
