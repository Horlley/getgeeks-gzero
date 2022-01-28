*** Settings ***
Documentation       Session route test suite

Resource                ../resources/Base.robot

*** Variables ***
&{inv_pass}         email=kim@dot.com           password=abc123
&{inv_email}        email=kim.dot.com           password=pwd123
&{email_404}        email=kim@404.com           password=pwd123
&{empty_email}      email=${EMPTY}              password=pwd123
&{wo_email}         password=pwd123
&{empty_pass}       email=kim@dot.com           password=${EMPTY}
&{wo_pass}          email=kim@dot.com

*** Test Cases ***
User session
    # Dado que temos um usuário cadastrado
    ${pauload}              Factory User Session    signup
    POST Users              ${pauload}

    ${payload}              Factory User Session    login

    # Quando faço uma requisição POST na rota /sessions
    ${response}             POST Session            ${payload}

    # Então o Status deve ser 200
    Status Should Be        200                     ${response}

    # E deve gerar um token JWT
    ${size}                 Get Length              ${response.json()}[token]
    # ${expected_size}        Convert To Integer      140
    Should Be True          ${size} > 0
    # Should Be Equal         ${expected_size}        ${size}

    # E esse token deve explirar em 10 dias
    Should Be Equal         10d                     ${response.json()}[expires_in]

Should Not Get Token
    [Template]          Attempt POST Session

    ${inv_pass}         401         Unauthorized
    ${inv_email}        400         Incorrect email
    ${email_404}        401         Unauthorized
    ${empty_email}      400         Required email
    ${wo_email}         400         Required email
    ${empty_pass}       400         Required pass
    ${wo_pass}          400         Required pass

*** Keywords ***
Attempt POST Session
    [Arguments]         ${payload}          ${status_code}      ${error_message}
    ${response}         POST Session        ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]