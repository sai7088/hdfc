@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\brutusin\rpc-api\1.2.5\rpc-api-1.2.5.jar;"%REPO%"\org\brutusin\commons\1.4.3\commons-1.4.3.jar;"%REPO%"\org\brutusin\json\1.3.0\json-1.3.0.jar;"%REPO%"\org\springframework\spring-context\4.1.4.RELEASE\spring-context-4.1.4.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\4.1.4.RELEASE\spring-beans-4.1.4.RELEASE.jar;"%REPO%"\org\springframework\spring-core\4.1.4.RELEASE\spring-core-4.1.4.RELEASE.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\org\springframework\spring-expression\4.1.4.RELEASE\spring-expression-4.1.4.RELEASE.jar;"%REPO%"\org\brutusin\rpc-impl\1.2.5\rpc-impl-1.2.5.jar;"%REPO%"\commons-fileupload\commons-fileupload\1.3.1\commons-fileupload-1.3.1.jar;"%REPO%"\commons-io\commons-io\2.2\commons-io-2.2.jar;"%REPO%"\org\brutusin\rpc-repo\1.2.5\rpc-repo-1.2.5.jar;"%REPO%"\org\brutusin\rpc-tomcat\1.2.5\rpc-tomcat-1.2.5.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.28\tomcat-embed-core-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.28\tomcat-embed-logging-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.28\tomcat-embed-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.28\tomcat-embed-el-8.0.28.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.28\tomcat-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.0.28\tomcat-servlet-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.28\tomcat-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.28\tomcat-el-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.28\tomcat-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.28\tomcat-util-scan-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.28\tomcat-jasper-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.28\tomcat-jsp-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-websocket\8.0.28\tomcat-websocket-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-websocket-api\8.0.28\tomcat-websocket-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.28\tomcat-util-8.0.28.jar;"%REPO%"\org\brutusin\json-provider\2.3.0\json-provider-2.3.0.jar;"%REPO%"\com\fasterxml\jackson\module\jackson-module-jsonSchema\2.6.2\jackson-module-jsonSchema-2.6.2.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.6.0\jackson-annotations-2.6.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.6.2\jackson-core-2.6.2.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.6.2\jackson-databind-2.6.2.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\com\github\fge\json-schema-validator\2.2.6\json-schema-validator-2.2.6.jar;"%REPO%"\joda-time\joda-time\2.3\joda-time-2.3.jar;"%REPO%"\com\googlecode\libphonenumber\libphonenumber\6.2\libphonenumber-6.2.jar;"%REPO%"\com\github\fge\json-schema-core\1.2.5\json-schema-core-1.2.5.jar;"%REPO%"\com\github\fge\uri-template\0.9\uri-template-0.9.jar;"%REPO%"\com\github\fge\msg-simple\1.1\msg-simple-1.1.jar;"%REPO%"\com\github\fge\btf\1.2\btf-1.2.jar;"%REPO%"\com\google\guava\guava\16.0.1\guava-16.0.1.jar;"%REPO%"\com\github\fge\jackson-coreutils\1.8\jackson-coreutils-1.8.jar;"%REPO%"\org\mozilla\rhino\1.7R4\rhino-1.7R4.jar;"%REPO%"\javax\mail\mailapi\1.4.3\mailapi-1.4.3.jar;"%REPO%"\javax\activation\activation\1.1\activation-1.1.jar;"%REPO%"\net\sf\jopt-simple\jopt-simple\4.6\jopt-simple-4.6.jar;"%REPO%"\hdfc\clients\1.0-SNAPSHOT\clients-1.0-SNAPSHOT.war
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="exec" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" org.brutusin.rpc.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
