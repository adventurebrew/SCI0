echo off

:start
if not exist scpptmp.bat goto doit
pause scpptmp.bat in use by someone, you should retry in a while
goto done

:doit
echo rem temporary pretty formatting batch file > scpptmp.bat

if not "%1" == "" goto Loop
echo rem pretty-formatting *.sc and *.sh files >> scpptmp.bat
for %%f in (*.sc *.sh) do echo call scpp %%f   >> scpptmp.bat

:Loop
echo rem pretty-formatting %1 files            >> scpptmp.bat
for %%f in (%1) do echo call scpp %%f          >> scpptmp.bat
shift
if not "%1" == "" goto Loop

call scpptmp.bat
del  scpptmp.bat

:done 