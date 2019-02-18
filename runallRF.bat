@echo off

SET BROWSER=%1
SET TAG=%2

echo "Starts with arguments BROWSER=%BROWSER% TAG=%TAG%"
robot --variable BROWSER:%BROWSER% --include %TAG% --argumentfile environments/common-arguments.txt --outputdir robot-results .
