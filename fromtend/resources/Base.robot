*** Settings ***
Documentation       Base do teste

Library         Browser
Library         String
Library         Collections

Library         factories/User.py
Library         Utils.py

Resource        actions/_SharedActions.robot
Resource        actions/AuthActions.robot
Resource        actions/GeekActions.robot
Resource        actions/SignupActions.robot

Resource        Database.robot
Resource        Helpers.robot
Resource        Services.robot

*** Variables ***
${BASE_URL}         https://getgeeks-horley.herokuapp.com

*** Keywords ***
Start Session
    New Browser             ${BROWSER}          headless=${headless}        slowMo=00:00:00
#    New Browser            firefox             headless=${headless}      slowMo=00:00:00
    New Page                ${BASE_URL}
    Set Viewport Size       1280        768

After Test
    ${shot_name}        Screenshor Name
    Take Screenshot     fullPage=True           filename=${shot_name}
