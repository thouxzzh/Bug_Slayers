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
${file_loc}    ${CURDIR}${/}Images${/}img1.jpeg 
${submit_wcu}    xpath=//*[@id="root"]/div[1]/main/main/div/form/button
${search_wcu}    xpath=//input[@placeholder='Search WCU entries...']
${result}    xpath=//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx']/td[1]
${del}    xpath=(//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx'])[1]/td[4]/div/button[2]
${fele}    xpath=(//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx'])[1]/td[1]
${del_btn}    xpath=//div[@class='MuiDialogActions-root MuiDialogActions-spacing css-33pgcr']//button[2]
${edit_btn}    xpath=//div[@class='MuiBox-root css-1i27l4i']//child::button[1]
${update_wcu}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained']
${d}    xpath=//textarea[@name='description']
${t}    test
${des}    Our expert mentors provide continuous support, guiding each learner at every step of their career journey
${search_text}    test

*** Keywords ***

Go to menu
    Wait Until Element Is Visible    ${menu_btn}
    Click Button    ${menu_btn}

Click Home and select why choose us
    Wait Until Element Is Visible    ${home}
    Click Element    ${home}
    Wait Until Element Is Visible   ${wcu}
    Sleep    1s
    Click Element    ${wcu}

click add new new WCU
    Click Element    ${add_btn}

Fill the form details
    Input Text    ${title}          ${t}
    Input Text     ${description}   ${des}
    Execute JavaScript    document.querySelector("div.MuiDropzoneArea-root input").style.display = "block";
    Choose File    ${image}         ${file_loc}

click the submit WCU button
    Click Element    ${submit_wcu}

Search for the WCU
    Wait Until Element Is Visible    ${search_wcu}
    Input Text    ${search_wcu}    ${search_text}

Verify the search result
    Wait Until Element Is Visible    ${result}
    ${cells}    Get WebElements    ${result}
    FOR    ${cell}    IN    @{cells}
        ${text}    Get Text    ${cell}
        Log To Console    ${text}
        Should Contain    ${text}    ${search_text}
    END

Delete the WCU
    Click Element    ${del}
    Click Element    ${del_btn}
    Sleep    1
    Page Should Contain    No WCU entries found

Verify the WCU is added in WCU panel
    Search for the WCU
    Verify the search result

Click edit icon
    Search for the WCU
    Verify the search result
    Click Element    ${edit_btn}

Edit the fields with new value and click update
    [Arguments]    ${new_val}
    Wait Until Element Is Visible    ${d}
    Click Element    ${d}
    Press Keys    ${d}    CTRL+A    DELETE 
    Input Text    ${d}    edited_description
    Click Button    ${update_wcu}
    Sleep    2

Verify the new Values got updated in WCU fields
    [Arguments]    ${new_val}
    Page Should Contain    ${new_val}

    
    


    
    
    








