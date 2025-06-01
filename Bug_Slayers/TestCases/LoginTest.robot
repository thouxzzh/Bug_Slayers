*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Utilities/LoginDatas.csv    encoding=utf_8    dialect=unix
# Test Template    Verify login with valid credentials
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot

*** Variables ***
${username}
${pw}

*** Test Cases ***
verify login with valid
    [template]    Verify login with valid credentials    
    ${username}    ${pw}  

*** Keywords ***
Verify login with valid credentials
<<<<<<< HEAD
    [tags]    smoke
=======
>>>>>>> bec019ebc1d929a8bf3645fee54888b46eb957e0
    [Arguments]    ${username}    ${pw}
    Open the browser with url
    Fill the login form    ${username}    ${pw} 
    IF    '${username}' == 'Bugslayers@gmail.com' and '${pw}' == 'Bugslayers'
    Verify the Home Page
    ELSE IF    '${username}'==""
        verify userrequired message 
    ELSE IF    '${pw}'==""
        verify passwordrequired message 
    ELSE
        verify invalid message
    END
    close the browser session


