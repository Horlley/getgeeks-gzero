*** Settings ***
Documentation       Geek route test suite

Resource            ${EXECDIR}/resources/base.robot

*** Test Cases ***
Be a geek

    # Dado que temos um novo usuário
    ${user}         factory Be Geek
    Remove User     ${user}

    # E esse usuário é um cliente comum
    POST Users      ${user}

    # E esse uauário possui um token valido
    ${token}        Get Token       ${user}

    # Quando faço uma requisiçao posto na rota geek
    ${response}     POST Geek       ${token}        ${user}[geek_profile]

    # Então deve retonrnar 201
    Status Should Be    201     ${response}

    # E ao consultar esse usuário na API Users
    ${response}     GET Users    ${token}

    # Então o perfil geek deve ser retornado
    Should Be Equal As Strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As Strings      ${user}[email]      ${response.json()}[email]

    ${expedted_float}       Convert To Number        ${user}[geek_profile][whatsapp]
    ${got_float}            Convert To Number        ${response.json()}[whatsapp]

    Should Be Equal                 ${expedted_float}                       ${got_float}
    Should Be Equal As Strings      ${user}[geek_profile][desc]             ${response.json()}[desc]
    Should Be Equal As Strings      ${user}[geek_profile][cost]             ${response.json()}[cost]
    Should Be Equal As Strings      ${user}[geek_profile][printer_repair]   ${response.json()}[printer_repair]
    Should Be Equal As Strings      ${user}[geek_profile][work]             ${response.json()}[work]
    Should Be Equal As Strings      None                                    ${response.json()}[avatar]
    Should Be Equal As Strings      True                                    ${response.json()}[is_geek]

Get Geek List
    [Tags]          temp

    ${data}     Factory Search For Geeks

    FOR    ${geek}    IN    @{data}[geeks]
        POST Users      ${geek}
        ${token}        Get Token       ${geek}

        POST Geek       ${token}        ${geek}[geek_profile]
    END

    POST Users      ${data}[user]

    ${token}                Get Token       ${data}[user]
    ${response}             GET Geeks       ${token}
    Status Should Be        200             ${response}

    # Veridica se retorna uma lista
    ${total}                Get Length      ${response.json()}[Geeks]
    Should Be True          ${total} > 0
