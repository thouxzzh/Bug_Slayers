*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Cnt}                    xpath=//input[@id='count']
${Svc}                  xpath=//input[@id='service']
${Slgg}                     xpath=//input[@id='slug']
${Submit_Execution_Count}    xpath=//span[text()='Submit Execution Count']
${Menu}                    xpath=(//button[@type='button'])[1]
${Home}                    xpath=(//li[@class='MuiListItem-root MuiListItem-gutters css-bkmufr']//div)[1]
${Execution_Count}         xpath=(//div[@class='MuiList-root css-1uzmcsd']//div)[1]
${Add_Button}    xpath=//span[@class='MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel']

*** Keywords ***

Fill The Execution Count Add Form
    [Arguments]    ${count}    ${service}    ${slug}
    Input Text     ${Cnt}     ${count}
    Input Text     ${Svc}   ${service}
    Input Text     ${Slgg}      ${slug}
    Click Element    ${Submit_Execution_Count}
    Sleep    5s
    

Verify The Execution
    [Arguments]    ${expected_value}

    ${execution_items}=    Get WebElements    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[2]
    ${actual_items}=       Create List
    FOR    ${item}    IN    @{execution_items}
        ${name}=    Get Text    ${item}
        Log To Console    Item found: ${name}
        Append To List    ${actual_items}    ${name}
    END
    List Should Contain Value    ${actual_items}    ${expected_value}
    Sleep    5s

