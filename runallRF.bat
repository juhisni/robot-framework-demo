@echo off

SET ENVIRONMENT=%1
SET BROWSER=%2
SET TAG=%3

IF %ENVIRONMENT%==qa goto :execute_in_qa

:execute_in_qa
call slackviesti.bat
echo "Starts with arguments ENV=%ENVIRONMENT% BROWSER=%BROWSER% TAG=%TAG% in QA environment."
robot --variable ENVIRONMENT:%ENVIRONMENT% --variable BROWSER:%BROWSER% --include %TAG%ANDQA --argumentfile environments/common-arguments.txt --outputdir robot-results .
