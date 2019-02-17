@echo off

SET CONFIGURATION=%1
SET BROWSER=%2
SET TAG=%3

IF %CONFIGURATION%==jenkins goto :execute_in_jenkins
IF %CONFIGURATION%==local goto :execute_in_local

:execute_in_jenkins
echo "Starts with arguments CONFIGURATION=%CONFIGURATION% BROWSER=%BROWSER% TAG=%TAG%"
robot --variable CONFIGURATION:%CONFIGURATION% --variable BROWSER:%BROWSER% --include %TAG%ANDjenkins --argumentfile environments/common-arguments.txt --outputdir robot-results .

:execute_in_local
echo "Starts with arguments CONFIGURATION=%CONFIGURATION% BROWSER=%BROWSER% TAG=%TAG%"
robot --variable CONFIGURATION:%CONFIGURATION% --variable BROWSER:%BROWSER% --include %TAG%ANDlocal --argumentfile environments/common-arguments.txt --outputdir robot-results .
