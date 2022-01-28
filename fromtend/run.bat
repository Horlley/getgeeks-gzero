
robot -l NONE -o NONE -r NONE ./tasks/Delorean.robot
@REM robot -d ./logs ./tests/Signup.robot
@REM robot -d ./logs ./tests/
pabot -d ./logs -v BROWSER:chromium -v headless:False ./tests
@REM robot -d ./logs ./tests/SignupRequired.robot

rm -rf ./logs/browser
mkdir  ./logs/browser
mkdir  ./logs/browser/screenchot
find   ./logs/pabot_results -type f -name "*.png"
cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenchot