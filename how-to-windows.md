# Useful Windows Commands

Bring up the print server properties  
printui /s /t2

Dism /Online /Cleanup-Image /RestoreHealth

From Windows USB flash drive:
Type: notepad -> File, Open
Note drive letters
sfc /scannow /offbootdir=D:\ /offwindir=C:\Windows
Note that offbootdir contains the letter of your "System Reserved" partition and offwindir is the volume on which your broken, unbootable Windows 10 is located.