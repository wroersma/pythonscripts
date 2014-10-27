FOR /F "tokens=1" %%A IN (laptops.txt) DO (
	SET PC=%%A
	SET PC
	net use \\PC\IPC$ /USER:Administrator *
	psexec \\PC -c -f -s agent-version.exe
)
