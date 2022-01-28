*** Settings ***
Documentation       Helpers

*** Keywords ***
Get Token
    [Arguments]     ${user}

    # Obtendo o Token
    ${payload}          Create Dictionary
    ...                 email=${user}[email]
    ...                 password=${user}[password]

    ${response}         POST Session        ${payload}
    ${result}           Set Variable        ${EMPTY}

    IF  "200" in "${response}"
        # Pega o vaor do token
        ${result}       Set Variable            Bearer ${response.json()}[token]
    END

    [Return]        ${result}

Remove User
    [Arguments]     ${user}
    ${token}        Get Token    ${user}

    IF  "${user}"
        DELETE Users        ${token}
    END