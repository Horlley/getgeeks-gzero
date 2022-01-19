*** Settings ***
Documentation       Signup Test Suite

Resource            ../resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session


*** Test Cases ***
Register a new user
        ${user}                     Factory User

        Go To Signup Form
        Fill Signup Form            ${user}
        Submit Signup Form
        User Should Be Registered

Duplicate User
        [Tags]                      attempt_signup
        ${user}                     factory_user
        Add User From Database      ${user}
        Go To Signup Form
        Fill Signup Form            ${user}
        Submit Signup Form
        Modal Content Should Be     Já temos um usuário com o e-mail informado.

Wrong Email
        [tags]                      attempt_signup
        ${user}                     factory wrong email
        Go To Signup Form
        Fill Signup Form            ${user}
        Submit Signup Form
        Alert Span should Be        O email está estranho

Required Fields
        [Tags]          attempt_signup      reqF
        #[Template]      Signup Submit Without Form
        @{expected_alerts}      Create List
        ...                     Cadê o seu nome?
        ...                     E o sobrenome?
        ...                     O email é importante também!
        ...                     Agora só falta a senha!

        Go To Signup Form
        Submit Signup Form
        Alert Spans Should Be     ${expected_alerts}

Short Password
        [Tags]          attempt_signup      short_pass
        [Template]      Sign with Short Pass
        1
        12
        123
        1234
        12345
        a
        a2
        ab3
        ab3c
        a23bc
        -1
        acb#1

*** Keywords ***
Sign with Short Pass
        [Arguments]     ${short_pass}
        ${user}     Create Dictionary
        ...         name=Horley                 lastName=Amorim
        ...         email=robot@mail.com        password=${short_pass}

        Go To Signup Form
        Fill Signup Form            ${user}
        Submit Signup Form
        Alert Span Should Be        Informe uma senha com pelo menos 6 caracteres

#Signup Submit Without Form
#        [Arguments]                 ${expected_alert}
#        Go To Signup Form
#        Submit Signup Form
#        Alert Span Should Be        ${expected_alert}

#16
