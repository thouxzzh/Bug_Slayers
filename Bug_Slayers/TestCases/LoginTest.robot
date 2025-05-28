*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Utilities/LoginDatas.csv    encoding=utf_8    dialect=unix
Test Template    Verify login with valid credentials
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot

*** Variables ***
${username}
${pw}

*** Test Cases ***
verify login with valid    ${username}    ${pw}

*** Keywords ***
Verify login with valid credentials
    [Arguments]    ${username}    ${pw}
    Open the browser with url
    Fill the login form    ${username}    ${pw}  
    Verify the Home Page
    close the browser session

