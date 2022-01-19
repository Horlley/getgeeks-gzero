*** Settings ***
Documentation           Teste Helpers

Resource    Database.robot

*** Keywords ***
Add User From Database
    [Arguments]             ${user}

    Connect To Postgres
    Insert User             ${user}
    Disconnect From Database
