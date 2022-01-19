*** Settings ***
Documentation       Delorian

Resource            ../resources/Database.robot

*** Tasks ***
# De volta ao passado
Back To The Past
    # Database.robot
    Connect To Postgres
    Reset Env
    Users Seed
    Disconnect From Database