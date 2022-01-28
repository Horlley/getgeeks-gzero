*** Settings ***
Documentation       Users route

*** Keywords ***
POST Users
    [Arguments]         ${payload}
    ${response}         POST
    ...                 ${API_USERS}/users
    ...                 json=${payload}
    ...                 expected_status=any

    [Return]            ${response}

DELETE Users
    [Arguments]         ${token}
    ${headers}          Create Dictionary           Authorization=${token}

    ${response}         DELETE
    ...                 ${API_USERS}/users
    ...                 headers=${headers}
    ...                 expected_status=any

    [Return]             ${response}

GET Users
    [Arguments]         ${token}
    ${headers}          Create Dictionary           Authorization=${token}

    ${response}         GET
    ...                 ${API_USERS}/users
    ...                 headers=${headers}
    ...                 expected_status=any

    [Return]             ${response}

PUT User
    [Arguments]         ${token}        ${payload}
    ${headers}          Create Dictionary           Authorization=${token}
    ${response}         PUT
    ...                 ${API_USERS}/users
    ...                 json=${payload}
    ...                 headers=${headers}
    ...                 expected_status=any

    [Return]            ${response}