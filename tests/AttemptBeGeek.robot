*** Settings ***
Documentation       Attempt BeGeek test suite

Resource            ../resources/Base.robot

Suite Setup         Start Session For Attempt Be Geek
Test Template       Attempt Be a Geek


*** Variables ***
${long_desc}    Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos é isso ai.

*** Test Cases ***
Short desc              desc                Formato o seu PC        A descrição deve ter no minimo 80 caracteres
Long desc               desc                ${long_desc}            A descrição deve ter no máximo 255 caracteres
Empty desc              desc                ${EMPTY}                Informe a descrição do seu trabalho
Whats only ddd          whatsapp            11                      O Whatsapp deve ter 11 digitos contando com o DDD
Whats only number       whatsapp            999999999               O Whatsapp deve ter 11 digitos contando com o DDD
Empty whats             whatsapp            ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Cost Letters            cost                asdf                    Valor hora deve ser numérico
Cost alpha              cost                as12                    Valor hora deve ser numérico
Cost Special chars      cost                $%#@                    Valor hora deve ser numérico
Empty cost              cost                ${EMPTY}                Valor hora deve ser numérico
No printer reapir       printer_repair      ${EMPTY}                Por favor, informe se você é um Geek Supremo
No work                 work                ${EMPTY}                Por favor, selecione o modelo de trabalho

*** Keywords ***
Attempt Be a Geek
    [Arguments]         ${key}      ${input_field}      ${output_field}

    ${user}             Factory User    attempt_be_geek
    
    Set To Dictionary           ${user}[geek_profile]      ${key}      ${input_field}
    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Alert Span should Be        ${output_field}

    After Test

Start Session For Attempt Be Geek
    ${user}     Factory User    attempt_be_geek

    Start Session
    Do Login    ${user}
    Go To Geek Form


#Por favor, informe se você é um Geek Supremo
#
#Por favor, selecione o modelo de trabalho
#
#Valor hora deve ser numérico
