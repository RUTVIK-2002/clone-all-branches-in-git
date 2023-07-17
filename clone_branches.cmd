@echo off

REM Prompt user for GitHub repository link
set /p github_link=Enter GitHub repository link: 

REM Clone the repository
git clone %github_link%
REM Make User to Enter name of the Folder Change the name to the file you want to take data in github
cd <respository_name>

REM Fetch all branches
git fetch --all

REM Get the list of all branches
for /f "delims=" %%b in ('git branch -r ^| findstr /v "HEAD"') do (
  REM Trim branch name
  set "branch=%%b"
  setlocal enabledelayedexpansion
  set "branch=!branch:~9!"
  
  REM Checkout the branch
  echo Fetching branch: !branch!
  git checkout !branch!
  
  REM Do whatever you want with the branch here
  REM Example: Copy the files to a different directory
  xcopy /s /e /y .\source_directory .\destination_directory\!branch!
  
  endlocal
)
