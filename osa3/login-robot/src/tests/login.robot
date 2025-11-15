*** Settings ***
Resource  resource.robot

*** Test Cases ***
Login With Correct Credentials
    Create User And Input Login Command
    Input Credentials  kalle  kalle123
    Output Should Contain  Logged in

Login With Incorrect Password
    Create User And Input Login Command
    Input Credentials  kalle  kalle124
    Output Should Contain  Invalid username or password

Login With Nonexistent Username
    Create User And Input Login Command
    Input Credentials  venla  kalle123
    Output Should Contain  Invalid username or password

Register With Valid Username And Password
    Create User And Input New Command
    Input Credentials  venla  venla123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Create User And Input New Command
    Input Credentials  kalle  venla123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Create User And Input New Command
    Input Credentials  ka  venla123
    Output Should Contain  User name should be at least 3 characters long

Register With Enough Long But Invalid Username And Valid Password
    Create User And Input New Command
    Input Credentials  venla123  venla123
    Output Should Contain  Username should contain only letters

Register With Valid Username And Too Short Password
    Create User And Input New Command
    Input Credentials  venla123  ve1
    Output Should Contain  Password should be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Create User And Input New Command
    Input Credentials  venla123  venlavenla
    Output Should Contain  Password should not contain only letters

*** Keywords ***
Create User And Input Login Command
    Create User  kalle  kalle123
    Input Login Command

Create User And Input New Command
    Create User  kalle  kalle123
    Input New Command
    
