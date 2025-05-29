*** Settings ***
Documentation    Page Objects and Keywords for Pop Up Notification Panel
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Resource    ../Resources/LoginResource.robot
*** Variables ***
${menu}                      xpath=(//span[@class='MuiTouchRipple-root css-w0pj6f'])[1]/parent::button
${home}                      xpath=//span[text()='Home']
${pop-uppanel}    xpath=//span[text()='Pop Up Notification']
${assert_pop_up_panel}    xpath=//h4[text()='Pop-Up Notification Panel']
${toggle}    xpath=//input[@type='checkbox']
${edit}    xpath=(//button[@aria-label='edit'])[1]
${stack}    xpath=(//input[@type='text'])[1]
${update_pop_up_notification}    xpath=//button[text()='Update Pop-Up Notification']
${searchBox}    xpath=//input[@placeholder='Search notifications...']
${title}    xpath=//input[@id='title']
${description}    xpath=//input[@id='description']
${button_name}    xpath=//input[@id='button']
${link}    xpath=//input[@id='link']
${img_path}    ${CURDIR}${/}Images${/}img1.jpeg
${submit_pop_up}    xpath=//button[text()='Submit Pop-Up Notification']
${file_input_locator}    xpath=//input[@type='file']
${Add_new}    xpath=//button[text()='Add Notification']
${drop_down}    xpath=//p[text()='Rows per page:']/following-sibling::div/child::div
${drop_down_5}    xpath=//li[@data-value='5']
${num_of_stacks}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
${delete_popup}    xpath=(//button[@type='button'])[16]
${delete_dialogbox}    xpath=//button[text()='Delete']
*** Keywords ***
Navigate To Pop Up Notification Panel
    Wait Until Element Is Visible    ${menu}    timeout=10s
    Click Element                    ${menu}
    Wait Until Element Is Visible    ${home}    timeout=10s
    Click Element                    ${home}
    Wait Until Element Is Visible    ${pop-uppanel}    timeout=10s
    Click Element                    ${pop-uppanel}
    Wait Until Element Is Visible    ${assert_pop_up_panel}    timeout=10s
    Page Should Contain Element      ${assert_pop_up_panel}
   

Validate Edit Functionality
    Wait Until Element Is Visible    ${edit}    timeout=10s
    Sleep    5
    Click Button                    ${edit}
    Wait Until Element Is Visible    ${stack}    timeout=10s
    Scroll Element Into View         ${stack}
    Click Element                   ${stack}
    Sleep    3
    Press Keys                     NONE    CTRL+A
    Press Keys                     NONE    DELETE
    Sleep                          1
    Input Text                     ${stack}    aa
    Wait Until Element Is Visible    ${update_pop_up_notification}    timeout=10s
    Click Button                   ${update_pop_up_notification}
    Wait Until Element Is Visible    ${stack}    timeout=10s
    ${updated_value}=              Get Value    ${stack}
    Should Be Equal As Strings     ${updated_value}    aa

Validate Search Functionality
    Click Element    ${searchBox}
    Input Text    ${searchBox}    test
    Press Keys    ${searchBox}    RETURN
    Wait Until Page Contains Element    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]    timeout=5s
    @{elements}=    Get WebElements    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
    @{LIST}=        Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${LIST}    ${text}
    END
    ${count}=    Get Length    ${LIST}
    Should Be Equal As Integers    ${count}    2

Validate Search Functionality By Providing Unrelated Keyword
    Click Element    ${searchBox}
    Input Text    ${searchBox}    www
    Press Keys    ${searchBox}    RETURN 
    Page Should Contain    No notifications found   

Validate Rows Per Page Dropdown

    Click Element    ${drop_down}
    Sleep    2
    Click Element    ${drop_down_5}
    ${actual_count}=    Get Element Count    ${num_of_stacks}
    Should Be Equal As Integers    ${actual_count}    5    

Validate Adding New Pop Up Notification Panel  
    [Arguments]    ${Tit}    ${Descrp}    ${Button}    ${Linkk}
    Click Button    ${Add_new}
    Click Element    ${title}    
    Input Text    ${title}    ${Tit}    
    Click Element    ${description}
    Input Text    ${description}    ${Descrp}
    Click Element    ${button_name}
    Input Text    ${button_name}    ${Button}
    Click Element    ${link}
    Input Text    ${link}    ${Linkk}
    Click Element    xpath=//p[text()='Drag and drop an image here or click']
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Choose File    ${file_input_locator}    ${img_path}
    Click Button    ${submit_pop_up}

Validate Toggle Checkboxes Are Disabled After Click
    ${count}=    Get Element Count    ${toggle}
    FOR    ${i}    IN RANGE    1    ${count + 1}
        ${checkbox}=    Set Variable    xpath=(//input[@type='checkbox'])[${i}]
        Click Button    ${checkbox}
        Wait Until Keyword Succeeds    5s    500ms    Checkbox Should Not Be Selected    ${checkbox}
    END
Validate Toggle Checkboxes Are Enabled After Click
    ${count}=    Get Element Count    ${toggle}
    FOR    ${i}    IN RANGE    1    ${count + 1}
        ${checkbox}=    Set Variable    xpath=(//input[@type='checkbox'])[${i}]
        Click Button    ${checkbox}
        Wait Until Keyword Succeeds    5s    500ms    Checkbox Should Be Selected    ${checkbox}
    END 

Validate the Delete Functionality
    Wait Until Element Is Visible       ${delete_popup}           timeout=10s
    Element Should Be Enabled           ${delete_popup}
    Scroll Element Into View            ${delete_popup}
    Click Element                       ${delete_popup}

    Wait Until Element Is Visible       ${delete_dialogbox}          timeout=10s
    Click Button                        ${delete_dialogbox}
    Wait Until Page Does Not Contain    pop-up    timeout=5s
    Page Should Not Contain         pop-up
