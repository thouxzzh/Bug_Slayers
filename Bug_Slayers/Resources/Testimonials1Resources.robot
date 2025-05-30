*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Menu}                    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${Home}                    xpath=(//li[@class='MuiListItem-root MuiListItem-gutters css-bkmufr']//div)[1]
${Testimonial}         xpath=(//span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-1wnjc62'])[3]
${Add_Button}    xpath=//span[@class='MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel']
${Back_Button}    xpath=(//button[@type='button'])[4]
${sch_Bn}    xpath=//input[@type='text']
${Ed_bn}    xpath=(//div[@class='MuiBox-root css-18lah6a']/child::button)[1]
${rvw}    xpath=//textarea[@name='review']
${update_Tes_Count}    xpath=//button[@type='submit']
${bth}     xpath=//input[@name='batch']
${delete_Exe}    xpath=(//button[@type='button'])[6]
${del_butt}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
${Pagination_Dropdown}     xpath=//div[@role='combobox']
${Rows_Option_5}           xpath=//li[text()='5']
${Table_Rows}              xpath=//table//tbody/tr

*** Keywords ***
Navigate to the Testimonials Overview
    Click Element    ${Menu}
    Wait Until Element Is Enabled    ${Home}
    Click Element    ${Home}
    Wait Until Element Is Enabled    ${Testimonial}
    Click Element    ${Testimonial}
    Wait Until Page Contains Element    xpath=//h4[text()='Testimonials Overview']
    Page Should Contain    Testimonials Overview

Navigate to the Testimonial Add Form
    Click Element    ${Add_Button}
    Wait Until Page Contains Element    xpath=//h4[text()='Testimonial Add Form']
    Page Should Contain    Testimonial Add Form  

Back to the Testimonials Overview 
    Click Element    ${Back_Button}
    Page Should Contain    Testimonials Overview

Search for the element in Testimonial Overview
    Input Text    ${sch_Bn}    John
    Wait Until Page Contains    John
    Page Should Contain    John

Edit the element in Testimonial
    Click Element    ${Ed_bn}
    Sleep    3
    Wait Until Element Is Visible    ${rvw}
    Click Element    ${rvw}
    Press Keys    ${rvw}    CTRL+A    DELETE
    Input Text    ${rvw}    Intelligence and great work
    Click Element    ${rvw}
    Input Text    ${bth}    gayu        
    Sleep    3s  
    Click Button    ${update_Tes_Count}
    Page Should Contain    Intelligence and great work

Verify Testimonial Pagination Row Count
    [Arguments]    ${row_count}
    Click Element    ${Pagination_Dropdown}
    Wait Until Page Contains Element    xpath=//li[text()='${row_count}']
    Click Element    xpath=//li[text()='${row_count}']
    Sleep    1s
    ${rows}=    Get Element Count    ${Table_Rows}
    Should Be Equal As Integers    ${rows}    ${row_count}

Delete the element in Testimonial
    Click Element    ${delete_Exe}
    Wait Until Element Is Enabled    ${del_butt}
    Click Button    ${del_butt}
    Page Should Contain    No testimonials found



