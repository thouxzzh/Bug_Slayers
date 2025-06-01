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
${file}    ${CURDIR}${/}Images${/}img1.jpeg
${reg_user}    xpath=//div[@class='MuiBox-root css-e64tsz']/child::button   
${calander}    xpath=//button[@aria-label='Choose date']
${searchbar}    xpath=//input[@placeholder='Search users...']
${bug_admin}    xpath=(//tr[@class='MuiTableRow-root css-1gqug66'])//td[2]
${trash}    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorError MuiIconButton-sizeMedium css-1oh31is']
${del}    xpath=//div[@class='MuiDialogActions-root MuiDialogActions-spacing css-1vskg8q']/button[2]
${no_user}    xpath=//h6[@class='MuiTypography-root MuiTypography-h6 css-1anx036']
${edit_icon}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']//td[4]/button
${update}    xpath=//div[@class='MuiBox-root css-1d1jiby']/button[2]
${rpp}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
${dd}    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
${ele_5}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/li[1]

*** Keywords ***
Go to user setting
    Wait Until Element Is Visible    ${acc_setting}
    Sleep    5
    Click Element    ${acc_setting}
    Wait Until Element Is Visible    ${user}
    Click Element    ${user}

click add admin
    Wait Until Element Is Visible    ${add_admin}
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
    Wait Until Element Is Visible    ${calander}
    Click Element    ${calander}    
    Sleep    1s 
    Click Element    xpath=//button[normalize-space(text())='28']   
    Choose File    ${upload_profile}    ${file}

click the register user
    Click Element    ${reg_user}

*** Keywords ***
Assert Toast Message
    [Arguments]    ${expected_msg}
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'toast')]    timeout=15s
    ${toast_msg}=    Get Text    xpath=//div[contains(@class, 'toast')]
    Log    Actual toast message: ${toast_msg}
    Page Should Contain    ${expected_msg}

# Verify Required Error Message is displayed
#     Page Should Contain    Please fill out this field.

Search for the admin
    [Arguments]    ${name}
    Input Text    ${searchbar}    ${name} 

Verify the admin in search result
    [Arguments]    ${admin_name}
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
    Wait Until Element Is Visible    ${fname}
    Click Element    ${fname}
    Press Keys    ${fname}    CTRL+A    DELETE
    Sleep    2
    Input Text    ${fname}    ${new_value}
    Click Button    ${update}
    
Verify the edited field
    [Arguments]    ${new_val}
    Search for the admin    bugslayers124@gmail.com
    Verify the admin in search result    ${new_val}

click and select the rows per page
    Click Element    ${dd}
    Click Element    ${ele_5}
<<<<<<< HEAD
=======

verify the number of rows after filter
    ${count}    Get Element Count    ${rpp}
    Should Be Equal As Integers    ${count}    5


>>>>>>> bec019ebc1d929a8bf3645fee54888b46eb957e0

verify the number of rows after filter
    ${count}    Get Element Count    ${rpp}
    Should Be Equal As Integers    ${count}    5








    



