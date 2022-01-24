*** Settings ***
Documentation       Database Helpers

Library     DatabaseLibrary
Library     factories/User.py

*** Keywords ***
Connect To Postgres
    Connect to Database     psycopg2
    ...                     mqxzeahb    # banco de dados
    ...                     mqxzeahb    # Usuário
    ...                     QgujQd0mgXxX7-mQ162si_byL_A790dG    # Senha
    ...                     castor.db.elephantsql.com   #   Host
    ...                     5432    # Porta
    
Reset Env
    Execute Sql String    DELETE from public.geeks;
    Execute Sql String    DELETE from public.users;

Insert User
    # Tras os ados do arquivo User.py
    [Arguments]         ${user}
    ${hased_pass}       Get Hashed Pass     ${user}[password]

    ${q}                Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastName]', '${user}[email]', '${hased_pass}', false)

    Execute Sql String      ${q}

# Usuário semente
Users Seed
    ${user}         Factory User    login
    Insert User     ${user}
    
    ${user2}        Factory User    be_geek
    Insert User     ${user2}
    
    ${user3}        Factory User    attempt_be_geek
    Insert User     ${user3}
