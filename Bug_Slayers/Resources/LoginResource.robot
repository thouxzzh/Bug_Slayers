*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${uname}    xpath=//input[@id='signin-email']
${pword}    xpath=//input[@id='signin-password']
${loginBtn}    xpath=//button[@id='signin-submit']
${acc_setting}    xpath=//div[@class='MuiAvatar-root MuiAvatar-circular MuiAvatar-colorDefault css-n0s85']
${logout}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']//li[2]/div
${email_req}    xpath=//p[@id='signin-email-helper-text']
${pword_req}    xpath=//p[@id='signin-password-helper-text']
${incorrect}    Incorrect password or email

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${pw}
    Input Text    ${uname}    ${username}
    Input Password    ${pword}    ${pw}
    Click Button    ${loginBtn}

Verify the Home Page
    sleep    5
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome

verify userrequired message
    Element Text Should Be    ${email_req}    Email is required

verify passwordrequired message  
    Element Text Should Be    ${pword_req}    Password is required

verify invalid message      
   Page Should Contain    Incorrect password or email
