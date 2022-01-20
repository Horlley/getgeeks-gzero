*** Settings ***
Documentation       Login test Suite

Resource    ../resources/Base.robot
Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*** Test Cases ***
User login
    ${user}                         Factory User Login
    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Pass
    [Tags]      i_pass
    ${user}     Create Dictionary       email=horleylamorim@gmail.com       password=abc123
    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be             Usuário e/ou senha inválidos.

User not found
    [Tags]      user_404

    ${user}     Create Dictionary       email=horleylamorim@404.net       password=abc123
    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be             Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      i_email

    ${user}     Create Dictionary       email=horley.com.net       password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]          temp
    ${user}                 Create Dictionary       email=${EMPTY}              password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span should Be    E-mail obrigatório

Required Pass
    [Tags]          temp
    ${user}                 Create Dictionary       email=horley@gmail.com      password=${EMPTY}
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span should Be    Senha obrigatória

Required Fields
    [Tags]          temp
    @{expected_alert}           Create List
    ...                         E-mail obrigatório
    ...                         Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans should Be       ${expected_alert}

