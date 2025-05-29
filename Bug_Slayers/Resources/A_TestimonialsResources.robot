*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${nameee}    xpath=//input[@name='name']
${rts}     xpath=//input[@name='ratings']
${bth}     xpath=//input[@name='batch']
${rle}    xpath=//input[@name='role']
${rvw}    xpath=//textarea[@name='review']
${upload_img}    xpath=//div[@class='MuiDropzoneArea-root']
${Submit_Testimonial_Data}    xpath=//button[@type='submit']

*** Keywords ***

Fill The Testimonial Data Form
    [Arguments]    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}    
    Input Text     ${nameee}     ${Name}
    Input Text     ${rts}   ${Ratings}
    Input Text     ${bth}      ${Batch}
    Input Text    ${rle}    ${Role}
    Input Text    ${rvw}    ${Review}
    Choose File    ${upload_img}    C:\Users\thous\Pictures\mercury.jpg
    Sleep    6s
    Click Element    ${Submit_Testimonial_Data}

Verify The Testimonial Data
    [Arguments]    ${expected_value}
    ${execution_items}=    Get WebElements    xpath=//tr[@class='MuiTableRow-root MuiTableRow-hover css-1mdrnmx']/td[2]
    ${actual_items}=       Create List
    FOR    ${item}    IN    @{execution_items}
        ${name}=    Get Text    ${item}
        Log To Console    Item found: ${name}
        Append To List    ${actual_items}    ${name}
    END
    List Should Contain Value    ${actual_items}    ${expected_value}


