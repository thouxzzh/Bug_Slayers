*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${nameee}    xpath=//input[@name='name']
${rts}       xpath=//input[@name='ratings']
${bth}       xpath=//input[@name='batch']
${rle}       xpath=//input[@name='role']
${rvw}       xpath=//textarea[@name='review']
${Image}    ${CURDIR}${/}Images${/}img1.jpeg
${Submit_Testimonial_Data}    xpath=//button[@type='submit']

*** Keywords ***

Fill The Testimonial Data Form
    [Arguments]    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}
    Input Text     ${nameee}     ${Name}
    Input Text     ${rts}        ${Ratings}
    Input Text     ${bth}        ${Batch}
    Input Text     ${rle}        ${Role}
    Input Text     ${rvw}        ${Review}
    Choose File    (//div[@class='MuiDropzoneArea-root']//input)[1]    ${Image}   
    Sleep    5s
    Click Element    ${Submit_Testimonial_Data}
