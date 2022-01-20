robot -l NONE -o NONE -r NONE .\tasks\Delorean.robot
@REM robot -d .\logs .\tests\Signup.robot
@REM robot -d .\logs .\tests\
robot -d .\logs -i temp .\tests\Login.robot
@REM robot -d .\logs .\tests\SignupRequired.robot