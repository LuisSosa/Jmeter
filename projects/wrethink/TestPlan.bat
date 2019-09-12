@echo off

	for /f "delims=" %%a in ('wmic OS get localdatetime  ^| find "."') do set datetime=%%a
	set "YYYY=%datetime:~0,4%"
	set "MM=%datetime:~4,2%"
	set "DD=%datetime:~6,2%"
	set "HH=%datetime:~8,2%"
	set "MI=%datetime:~10,2%"
	set "SS=%datetime:~12,2%"
	set foldername=%YYYY%-%MM%-%DD%_%HH%.%MI%.%SS%
	set myPath=C:\Jmeter
	
	mkdir %myPath%\projects\wrethink\reports\%foldername%
	
	call jmeter -n -t %myPath%\projects\wrethink\workbench\main.jmx -l %myPath%\projects\wrethink\reports\%foldername%\report.csv -e -o %myPath%\projects\wrethink\reports\%foldername%\HTMLReports 
	echo "<< TEST PLAN >>"
	
	if exist %myPath%\projects\wrethink\jmeter.log move %myPath%\projects\wrethink\jmeter.log %myPath%\projects\wrethink\reports\%foldername%
	
pause