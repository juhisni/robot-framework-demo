@echo off

:: Set tags to be included in the startup of the batch
SET BROWSER=%1
SET TAG=%2

:: Command to start Robot Framework test run with chosen browser and tags. Also defines the arguments to be used and the directory for results.
echo "Starts with arguments BROWSER=%BROWSER% TAG=%TAG%"
robot --variable BROWSER:%BROWSER% --include %TAG% --argumentfile environments/common-arguments.txt --outputdir robot-results .
