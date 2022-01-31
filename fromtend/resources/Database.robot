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
    ${users}        Factory To Insert DB
    FOR    ${user}    IN    @{users}
        Insert User    ${user}
    END
