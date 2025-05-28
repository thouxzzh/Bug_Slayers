*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Utilities/LoginDatas.csv    encoding=utf_8    dialect=unix
Test Template    Verify login with valid credentials
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot

*** Variables ***
${username}
${password}

*** Test Cases ***
verify login with valid    ${username}    ${password}

*** Keywords ***
Verify login with valid credentials
    [Arguments]    ${username}    ${password}
    Open the browser with url
    Fill the login form    ${username}    ${password}  
    Verify the Home Page
    close the broswer session


