*** Settings ***
Documentation       Base test

Library             RequestsLibrary
Library             factories/User.py

Resource            routes/SessionsRoute.robot
Resource            routes/UsersRoute.robot
Resource            routes/GeekRoute.robot
Resource            Helpers.robot

*** Variables ***
${API_USERS}        https://getgeeks-users-horley.herokuapp.com
${API_GEEKS}        https://getgeeks-geeks-horley.herokuapp.com
