*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${uname}    xpath=//input[@id='signin-email']
${pword}    xpath=//input[@id='signin-password']
${loginBtn}    xpath=//button[@id='signin-submit']

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    ${uname}    ${username}
    Input Password    ${pword}    ${password}
    Click Button    ${loginBtn}
Verify the Home Page
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome
