*** Settings ***
Library    SeleniumLibrary
Library    collections

*** Variables ***
${acc_setting}    xpath=//div[@class='MuiAvatar-root MuiAvatar-circular MuiAvatar-colorDefault css-n0s85']
${user}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/child::li[1]
${add_admin}    xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87']/child::button
${fname}    xpath=//input[@name='firstName']
${lname}    xpath=//input[@name='lastName']
${mail}    (//input[@name='lastName']/following::div/input)[1]
${ph}    xpath=//input[@name='phone']
${pwordd}    xpath=(//input[@name='phone']/following::div/input)[1]
${gen}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-formControl css-fvipm8']
${male}    xpath=//li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz']
${d}    xpath=//input[@placeholder='MM/DD/YYYY']
${upload_profile}    xpath=//input[@id='profile-pic-upload']
${reg_btn}    xpath=//input[@id='profile-pic-upload']//following::button
${file}    D:/SmartCliff_Robot/Smartcliff_RobotFramework/Bug_Slayers/Utilities/Screenshot (29).png 
${reg_user}    xpath=//div[@class='MuiBox-root css-e64tsz']/child::button   
${calander}    xpath=//button[@aria-label='Choose date']
${searchbar}    xpath=//input[@placeholder='Search users...']
${bug_admin}    xpath=(//tr[@class='MuiTableRow-root css-1gqug66'])//td[2]
${trash}    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorError MuiIconButton-sizeMedium css-1oh31is']
${del}    xpath=//div[@class='MuiDialogActions-root MuiDialogActions-spacing css-1vskg8q']/button[2]
${no_user}    xpath=//h6[@class='MuiTypography-root MuiTypography-h6 css-1anx036']
${edit_icon}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']//td[4]/button
${update}    xpath=//div[@class='MuiBox-root css-1d1jiby']/button[2]

*** Keywords ***
Go to user setting
    Sleep    8
    Click Element    ${acc_setting}
    Click Element    ${user}

click add admin
    Click Element    ${add_admin}

Fill Registration form
    [Arguments]    ${Firstname}    ${Lastname}    ${Email}    ${Phone}    ${Password}    ${Gender}    ${DOB}
    Wait Until Element Is Visible    ${fname}
    Input Text    ${fname}    ${Firstname}
    Input Text    ${lname}    ${Lastname}
    Input Text    ${ph}    ${Phone}
    Input Text    ${mail}    ${Email}
    Input Text    ${pwordd}    ${Password}
    Click Element    ${gen}
    Wait Until Element Is Visible    xpath=//li[@role='option' and normalize-space(text())='${Gender}']
    Click Element    xpath=//li[@role='option' and normalize-space(text())='${Gender}']
    Click Element    ${d}
    Sleep    1s
    Click Element    ${calander}    
    Sleep    1s 
    Click Element    xpath=//button[normalize-space(text())='28']   
    Choose File    ${upload_profile}    ${file}

click the register user
    Click Element    ${reg_user}
    Sleep    10s

Assert Toast Message
    [Arguments]    ${expected_msg}    
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'toast')]    10s
    ${toast_msg}=    Get Text    xpath=//div[contains(@class, 'toast')]
    Should Be Equal    ${toast_msg}    ${expected_msg}

# Verify Required Error Message is displayed
#     Page Should Contain    Please fill out this field.

Search for the admin
    [Arguments]    ${name}
    Input Text    ${searchbar}    ${name} 

Verify the admin in search result
    [Arguments]    ${admin_name}
    Sleep    5
    Wait Until Page Contains Element    ${bug_admin}
    Element Text Should Be    ${bug_admin}    ${admin_name}

click and confirm the delete
    Click Element    ${trash}
    Click Element    ${del}

verify the deletion of the user
    Element Text Should Be    ${no_user}    No users found 

click edit icon and edit the information
    [Arguments]    ${new_value}
    Click Element    ${edit_icon}
    Sleep    3
    Wait Until Element Is Visible    ${fname}
    Click Element    ${fname}
    Sleep    5
    Press Keys    ${fname}    CTRL+A    DELETE
    Sleep    3
    Input Text    ${fname}    ${new_value}
    Click Button    ${update}


Verify the edited field
    [Arguments]    ${new_val}
    Search for the admin    bugslayers124@gmail.com
    Verify the admin in search result    ${new_val}


    








    



