@echo off

set name="snake"

set path=%path%;.\make\bin\

set CC65_HOME=.\make\

cc65 -Oirs %name%.c --add-source
ca65 crt0.s
ca65 %name%.s -g

ld65 -C nrom_32k_vert.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt

del *.o

move /Y labels.txt BUILD\ 
move /Y %name%.s BUILD\ 
copy /Y %name%.nes BUILD\ 
copy /Y %name%.nes MESEN\ 

pause

.\MESEN\MESEN.EXE %name%.nes
