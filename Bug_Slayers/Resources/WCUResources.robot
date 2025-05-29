*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_btn}    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${home}    xpath=(//div[@class='MuiListItemText-root css-1nmt8ps'])[1]
${wcu}    xpath=(//div[@class='MuiListItemText-root css-1tsvksn'])[4]
${add_btn}    xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87']//button
${title}    xpath=(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[1]
${description}    xpath=(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[2]
${image}    xpath=//div[@class='MuiDropzoneArea-root']/input
${file_loc}    D:/SmartCliff_Robot/Smartcliff_RobotFramework/Bug_Slayers/Utilities/Screenshot (29).png 
${submit_wcu}    xpath=//div[@class='MuiDropzoneArea-root']/input/following::button
${search_wcu}    xpath=//input[@placeholder='Search WCU entries...']
${result}    xpath=//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx']/td[1]
${del}    xpath=(//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx'])[1]/td[4]/div/button[2]
${fele}    xpath=(//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx'])[1]/td[1]
${del_btn}    xpath=//div[@class='MuiDialogActions-root MuiDialogActions-spacing css-33pgcr']//button[2]
${t}    demo
${des}    Our expert mentors provide continuous support, guiding each learner at every step of their career journey
${search_text}    test

*** Keywords ***

Go to menu
    Wait Until Element Is Visible    ${menu_btn}
    Click Button    ${menu_btn}

Click Home and select why choose us
    Sleep    2
    Click Element    ${home}
    Click Element    ${wcu}

click add new new WCU
    Click Element    ${add_btn}

Fill the form details
    Input Text    ${title}          ${t}
    Execute JavaScript    document.querySelector("div.MuiDropzoneArea-root input").style.display = "block";
    Choose File    ${image}         ${file_loc}
    Sleep          2s
    Input Text     ${description}   ${des}
    # Click Button   xpath=//button[contains(.,'SUBMIT WCH')]
    Click Element    ${submit_wcu}
    Sleep    10

click the submit WCU button
    Click Element    ${submit_wcu}
    Sleep    5

Search for the WCU
    Input Text    ${search_wcu}    ${search_text}

Verify the search result
    Wait Until Element Is Visible    ${result}
    ${cells}    Get WebElements    ${result}
    FOR    ${cell}    IN    @{cells}
        ${text}    Get Text    ${cell}
        Log To Console    ${text}
        Should Contain    ${text}    ${search_text}
    END

# Delete the WCU
#     Wait Until Element Is Visible    ${result}
#     ${cells}    Get WebElements    ${result}
#     ${c}    Set Variable    0
#     FOR    ${cell}    IN    @{cells}
#         ${c}    Evaluate    c + 1    c=${c}
#         ${text}    Get Text    ${cell}
#         IF    '${text}' == '${search_text}'
#             ${del}    Set Variable    xpath=(//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx])[${c}]/td[4]/div/button[2]
#             Exit For Loop
#         END
#     END
#     Sleep    10s
#     Page Should Not Contain Element    ${del}

Delete the WCU
    Click Element    ${del}
    Click Element    ${del_btn}
    Sleep    2
    Page Should Contain    No WCU entries found


    
    
    








