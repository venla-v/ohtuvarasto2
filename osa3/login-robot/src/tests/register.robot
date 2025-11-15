*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input New Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  venla  venla123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  venla123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  ka  venla123
    Output Should Contain  User name should be at least 3 characters long

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  venla123  venla123
    Output Should Contain  Username should contain only letters

Register With Valid Username And Too Short Password
    Input Credentials  venla123  ve1
    Output Should Contain  Password should be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  venla123  venlavenla
    Output Should Contain  Password should not contain only letters


*** Keywords ***
Create User And Input New Command
    Create User  kalle  kalle123
    Input New Command
