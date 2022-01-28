*** Settings ***
Documentation       BeGeek test suite

Resource            ../resources/Base.robot

Suite Setup         Start Session
Test Teardown       After Test

*** Test Cases ***
Be a Geek
    [Tags]      BeGeek      Smoke
    # Dado que eu tenho um usuário comum
    ${user}         Factory User        be_geek

    # Fazer login na plataforma Getgeeks
    Do Login                    ${user}
    # Qaundo submeto o formulário para me tornar um Geek (prestador de serviços)
    Go To Geek Form
    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    # Então devo ver a mensgem de sucesso
    Geek Form Should Be Success


## Descrição curta
#Short Description
#        [Tags]      shortDescriprion
#        ${user}         Factory User        short_desc
#        Do Login                    ${user}
#        Go To Geek Form
#        Fill Geek Form              ${user}[geek_profile]
#        Submit Geek Form
#        Alert Span should Be        A descrição deve ter no minimo 80 caracteres
#
#Long Description
#        [Tags]          long_Descriprion
#        ${user}                     Factory User    long_desc
#        Do Login                    ${user}
#        Go To Geek Form
#        Fill Geek Form              ${user}[geek_profile]
#        Submit Geek Form
#        Alert Span should Be        A descrição deve ter no máximo 255 caracteres
#
#Empty Description
#        [Tags]          empty_descriprion
#        ${user}                     Factory User    empty_desc
#        Do Login                    ${user}
#        Go To Geek Form
#        Fill Geek Form              ${user}[geek_profile]
#        Submit Geek Form
#        Alert Span should Be        Informe a descrição do seu trabalho
#
#Empty whats
#        [Tags]          empty_whats
#        ${user}                     Factory User    empty_whats
#        Do Login                    ${user}
#        Go To Geek Form
#        Fill Geek Form              ${user}[geek_profile]
#        Submit Geek Form
#        Alert Span should Be        O Whatsapp deve ter 11 digitos contando com o DDD
