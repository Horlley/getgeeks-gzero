*** Settings ***
Documentation       Users route test suite

Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/resources/Helpers.robot

*** Test Cases ***
Add new user
    ${user}                 Factory New User
    # Remove usuário
    Remove User             ${user}

    ${response}             POST Users          ${user}
    Status Should Be        201                 ${response}

    ${user_id}              Set Variable         ${response.json()}[id]
    Should Be True          ${user_id} > 0

Get user data

    ${user}                 Factory Get User
    POST Users              ${user}
    # Pega o token
    ${token}                Get Token       ${user}
    # Faz o GET user passando o valor do token
    ${response}             GET Users       ${token}
    Status Should Be        200             ${response}

    # Validar nome completo e o email retornado da soliicitação GET
    Should Be Equal As Strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As Strings      ${user}[email]      ${response.json()}[email]
    # Validar Zap, valor nulo
    Should Be Equal As Strings      None                ${response.json()}[whatsapp]
    Should Be Equal As Strings      None                ${response.json()}[avatar]
    Should Be Equal As Strings      False               ${response.json()}[is_geek]

Remove user

    # Dado que existe um usuário no sitema
    ${user}                 Factory Remove User
    POST Users              ${user}

    # E tenho um token desse usuario
    ${token}                Get Token       ${user}

    # Quando faço uma solicitação de remoção na Rota /users
    ${response}             DELETE Users       ${token}

    # Entao deve retornar o Status code 204 (no content)
    Status Should Be        204             ${response}

    # E ao fazer uma requisição GET, deve retornar o status code 404 (not found)
    ${response}             GET Users       ${token}
    Status Should Be        404             ${response}

Update a user
    ${user}                 Factory Update User
    POST Users              ${user}[before]
    
    ${token}                Get Token    ${user}[before]

    ${response}             PUT User        ${token}        ${user}[after]
    Status Should Be        200             ${response}

    ${response}             GET Users       ${token}

    Should Be Equal As Strings      ${user}[after][name]            ${response.json()}[name]
    Should Be Equal As Strings      ${user}[after][email]           ${response.json()}[email]
    Should Be Equal As Strings      ${user}[after][whatsapp]        ${response.json()}[whatsapp]
    Should Be Equal As Strings      ${user}[after][avatar]          ${response.json()}[avatar]
    Should Be Equal As Strings      False                           ${response.json()}[is_geek]
