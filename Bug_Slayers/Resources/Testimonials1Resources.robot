*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Menu}                    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${Home}                    xpath=(//li[@class='MuiListItem-root MuiListItem-gutters css-bkmufr']//div)[1]
${Testimonial}            xpath=(//span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-1wnjc62'])[3]
${Add_Button}             xpath=//span[@class='MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel']
${Back_Button}            xpath=(//button[@type='button'])[4]
${sch_Bn}                 xpath=//input[@type='text']
${Ed_bn}                 xpath=(//div[@class='MuiBox-root css-18lah6a']/child::button)[1]
${rvw}                    xpath=//textarea[@name='review']
${update_Tes_Count}       xpath=//button[@type='submit']
${bth}                    xpath=//input[@name='batch']
${delete_Exe}             xpath=(//button[@type='button'])[6]
${del_button}             xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
${Pagination_Dropdown}    xpath=//div[@role='combobox']
${Rows_Option_5}          xpath=//li[text()='5']
${Table_Rows}             xpath=//table//tbody/tr

*** Keywords ***

Navigate to the Testimonials Overview
    Click Element    ${Menu}
    Wait Until Element Is Enabled    ${Home}    timeout=10s
    Click Element    ${Home}
    Wait Until Element Is Enabled    ${Testimonial}    timeout=10s
    Click Element    ${Testimonial}
    Wait Until Page Contains Element    xpath=//h4[text()='Testimonials Overview']    timeout=10s
    Page Should Contain    Testimonials Overview

Navigate to the Testimonial Add Form
    Click Element    ${Add_Button}
    Wait Until Page Contains Element    xpath=//h4[text()='Testimonial Add Form']    timeout=10s
    Page Should Contain    Testimonial Add Form

Back to the Testimonials Overview 
    Click Element    ${Back_Button}
    Wait Until Page Contains    Testimonials Overview    timeout=10s
    Page Should Contain    Testimonials Overview

Search for the element in Testimonial Overview
    # Wait Until Element Is Visible    ${sch_Bn}    timeout=10s
    Sleep    5s
    Input Text    ${sch_Bn}    John
    Wait Until Page Contains    John    timeout=10s
    Page Should Contain    John

Edit the element in Testimonial
    Click Element    ${Ed_bn}
    Wait Until Element Is Visible    ${rvw}    timeout=10s
    Click Element    ${rvw}
    Press Keys    ${rvw}    CTRL+A    DELETE
    Input Text    ${rvw}    Intelligence and great work
    Wait Until Element Is Visible    ${bth}    timeout=10s
    Input Text    ${bth}    gayu        
    Wait Until Element Is Enabled    ${update_Tes_Count}    timeout=10s
    Click Button    ${update_Tes_Count}
    Page Should Contain    Intelligence and great work

Verify Testimonial Pagination Row Count
    [Arguments]    ${row_count}
    Click Element    ${Pagination_Dropdown}
    Wait Until Page Contains Element    xpath=//li[text()='${row_count}']    timeout=10s
    Click Element    xpath=//li[text()='${row_count}']
    Wait Until Element Is Visible    ${Table_Rows}    timeout=10s
    ${rows}=    Get Element Count    ${Table_Rows}
    Should Be Equal As Integers    ${rows}    ${row_count}

Delete the element in Testimonial
    Click Element    ${delete_Exe}
    Wait Until Element Is Enabled    ${del_button}    timeout=10s
    Click Button    ${del_button}
    Wait Until Page Contains    No testimonials found    timeout=10s
    Page Should Contain    No testimonials found
