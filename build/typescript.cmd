pushd "%~dp0_typescript\"

echo Installing packages...
call npm install typescript@2.5.2 --no-save

echo Deleting unneeded files and folders...
del /s /q *.html > nul
del /s /q *.markdown > nul
del /s /q *.md > nul
del /s /q *.npmignore > nul
del /s /q *.patch > nul
del /s /q *.txt > nul
del /s /q *.yml > nul
del /s /q .editorconfig > nul
del /s /q .eslintrc > nul
del /s /q .gitattributes > nul
del /s /q .jscsrc > nul
del /s /q .jshintrc > nul
del /s /q CHANGELOG > nul
del /s /q CNAME > nul
del /s /q example.js > nul
del /s /q generate-* > nul
del /s /q gruntfile.js > nul
del /s /q gulpfile.* > nul
del /s /q makefile.* > nul
del /s /q README > nul

:: specific to typescript
del /s /q *services* > nul
del /s /q *typings* > nul
del /s /q *server* > nul
del /s /q *tsc* > nul
del /s /q *watchGuard* > nul
del /s /q package-lock.json > nul

for /d /r . %%d in (benchmark)  do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (bench)      do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (doc)        do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (docs)       do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (example)    do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (examples)   do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (images)     do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (man)        do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (media)      do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (scripts)    do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (test)       do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (tests)      do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (testing)    do @if exist "%%d" rd /s /q "%%d" > nul
for /d /r . %%d in (tst)        do @if exist "%%d" rd /s /q "%%d" > nul

echo Compressing artifacts and cleans up...
"%~dp07z.exe" a -r "%~dp0..\test\typescript_files.zip" ./_typescript * > nul
rmdir /S /Q "%~dp0_typescript\node_modules" > nul


:done
echo Done
popd