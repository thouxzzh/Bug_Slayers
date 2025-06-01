*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=D:/SmartCliff_Robot/Smartcliff_RobotFramework/Bug_Slayers/Utilities/RegDatas.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RegisterResources.robot
Resource    ../Resources/LoginResource.robot
Test Template    Verify the user can add new admin    

*** Variables ***
${Firstname}
${Lastname}
${Email}
${Phone}
${Password}
${Gender}
${DOB}

*** Test Cases ***
Add Admin Test
    Add admin with ${Firstname}    ${Lastname}    ${Email}    ${Phone}    ${Password}    ${Gender}    ${DOB}
   
*** Keywords ***
Verify the user can add new admin
    [tags]    smoke
    [Arguments]    ${Firstname}    ${Lastname}    ${Email}    ${Phone}    ${Password}    ${Gender}    ${DOB}  
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to user setting
    click add admin
    Fill Registration form    ${Firstname}    ${Lastname}    ${Email}    ${Phone}    ${Password}    ${Gender}    ${DOB}
    click the register user
    Assert Toast Message    Admin registered successfully
    close the browser session      