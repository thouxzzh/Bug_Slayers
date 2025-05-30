*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Menu}                    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${Home}                    xpath=(//li[@class='MuiListItem-root MuiListItem-gutters css-bkmufr']//div)[1]
${Execution_Count}         xpath=(//div[@class='MuiList-root css-1uzmcsd']//div)[1]
${Add_Button}    xpath=//span[@class='MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel']
${Search_Button}    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi']
${Count}                    xpath=(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[1]
${Edit_Button}    xpath=(//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-1uvi852']//child::button)[1]
${update_Exe_Count}    xpath=//div[@class='MuiBox-root css-1m25gr9']//button
${delete_Exe}    xpath=(//button[@type='button'])[6]
${del_button}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
${Pagination_Dropdown}     xpath=//div[@role='combobox']
${Rows_Option_5}           xpath=//li[text()='5']
${Table_Rows}              xpath=//table//tbody/tr

*** Keywords ***
Verify the Navigation 
    Click Element    ${Menu}
    Wait Until Element Is Enabled    ${Home}
    Click Element    ${Home}
    Wait Until Element Is Enabled    ${Execution_Count}
    Click Element    ${Execution_Count}
    Wait Until Page Contains Element    xpath=//h4[text()='Execution Count Panel']
    Page Should Contain    Execution Count Panel
    Click Element    ${Add_Button}
    Wait Until Page Contains Element    xpath=//h4[text()='Execution Count Add Form']
    Page Should Contain    Execution Count Add Form

Navigate to the Executive Count
    Click Element    ${Menu}
    Wait Until Element Is Enabled    ${Home}
    Click Element    ${Home}
    Wait Until Element Is Enabled    ${Execution_Count}
    Click Element    ${Execution_Count}
    Wait Until Page Contains Element    xpath=//h4[text()='Execution Count Panel']
    Page Should Contain    Execution Count Panel

Search for the element in Navigation
    Input Text    ${Search_Button}    Tester
    Page Should Contain    Tester

Edit the element in Executive Count
    Click Element    ${Edit_Button}
    Click Element    ${Count}
    Press Keys    ${Count}    CTRL+A
    Press Keys    ${Count}    BACKSPACE
    Input Text    ${Count}    5
    Click Element    ${update_Exe_Count}
    Page Should Contain    5

Verify Pagination Row Count
    [Arguments]    ${row_count}
    Click Element    ${Pagination_Dropdown}
    Wait Until Page Contains Element    xpath=//li[text()='${row_count}']
    Click Element    xpath=//li[text()='${row_count}']
    ${rows}=    Get Element Count    ${Table_Rows}
    Should Be Equal As Integers    ${rows}    ${row_count}

Delete the element in Executive Count
    [Tags]    regression    delete
    Click Element    ${delete_Exe}
    Wait Until Element Is Enabled    ${del_button}
    Click Button    ${del_button}
    Page Should Contain    No home service counts found
    