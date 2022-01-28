*** Settings ***
Documentation           Teste Helpers

Resource        Database.robot
Resource        ../resources/Base.robot

*** Keywords ***
Add User From Database
    [Arguments]         ${user}

    Connect To Postgres
    Insert User         ${user}
    Disconnect From Database

Do Login
    [Arguments]                     ${user}

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}