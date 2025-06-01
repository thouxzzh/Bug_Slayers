*** Settings ***
Documentation    Page Objects and Keywords for Execution Slider
Library    SeleniumLibrary
Resource    ../Resources/LoginResource.robot
*** Variables ***
${menu}                      xpath=(//span[@class='MuiTouchRipple-root css-w0pj6f'])[1]/parent::button
${home}                      xpath=//span[text()='Home']
${execution_slider}          xpath=//span[text()='Execution Slider']
${assert_execution_slider}   xpath=//h4[text()='Execution Slider Panel']
${edit}    xpath=(//button[@aria-label='edit'])[1]
${stack}    xpath=//input[@type='text']
${count}    xpath=//input[@type='number']
${update_execute_slider}    xpath=//button[text()='Update Execution Slider']
${username}    Bugslayers@gmail.com
${password}    Bugslayers
${searchBox}    xpath=//input[@placeholder='Search home execution highlights...']
${search_result}    xpath=//input[@tabindex='-1']/parent::div/following-sibling::p
${add_new_slider}    xpath=(//button[@tabindex='0'])[4]
${img_path}    ${CURDIR}${/}Images${/}img1.jpeg
${drag_and_drop_img}    xpath=//p[text()='Drag and drop images here or click']
${file_input_locator}    xpath=//input[@type='file']
${submit_execution_slider}    xpath=//button[@type='submit']
${click_next}    xpath=//button[@aria-label='Go to next page']
${delete_newstack}    xpath=(//button[@type='button'])[18]
${delete_dialogbox}    xpath=//button[text()='Delete']
${drop_down}    xpath=//p[text()='Rows per page:']/following-sibling::div/child::div
${drop_down_5}    xpath=//li[@data-value='5']
${num_of_stacks}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
${back_button}    //button[text()='Back']
*** Keywords ***
Navigate To Execution Slider
    Wait Until Element Is Visible    ${menu}    timeout=10s
    Click Element                    ${menu}
    Wait Until Element Is Visible    ${home}    timeout=10s
    Click Element                    ${home}
    Wait Until Element Is Visible    ${execution_slider}    timeout=10s
    Click Element                    ${execution_slider}
    Wait Until Element Is Visible    ${assert_execution_slider}    timeout=10s
    Page Should Contain Element      ${assert_execution_slider}

Validate Edit Button
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
    Input Text                     ${stack}    browser
    Wait Until Element Is Visible    ${update_execute_slider}    timeout=10s
    Click Button                   ${update_execute_slider}
    Wait Until Element Is Visible    ${stack}    timeout=10s
    ${updated_value}=              Get Value    ${stack}
    Should Be Equal As Strings     ${updated_value}    browser


# Validate Edit Functionality Without Providing Stack
#     Wait Until Element Is Visible    ${edit}    timeout=10s
#     Sleep    2s
#     Click Button                    ${edit}
#     Wait Until Element Is Visible    ${stack}    timeout=10s
#     Scroll Element Into View        ${stack}
#     Click Element                   ${stack}
#     Press Keys                     NONE    CTRL+A
#     Press Keys                     NONE    DELETE
#     Wait Until Element Is Visible    ${update_execute_slider}    timeout=10s
#     Click Button                   ${update_execute_slider}
#     ${valid_msg}=    Execute Javascript    return arguments[0].validationMessage;    ${stack}
#     Should Be Equal                 ${valid_msg}    Please fill out this field.

 
Validate Search Functionality
    Click Element    ${searchBox}  
    Input Text    ${searchBox}    browser
    Sleep    2
    Element Text Should Be    ${search_result}    1–1 of 1
Validate Search Functionality By Providing Unrelated Keyword
    Click Element    ${searchBox}
    Input Text    ${searchBox}    wwww
    Page Should Contain    No execution highlights found

Validate Adding New Execution Slider
    Click Button    ${add_new_slider}
    Wait Until Element Is Visible    ${stack}    timeout=10s
    Input Text    ${stack}    new
    Input Text    ${count}    5
    Click Element    xpath=//p[text()='Drag and drop images here or click']
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Choose File    ${file_input_locator}    ${img_path}
    Click Button    ${submit_execution_slider}
Validate the Delete Functionality
    Wait Until Element Is Visible       ${delete_newstack}           timeout=10s
    Element Should Be Enabled           ${delete_newstack}
    Scroll Element Into View            ${delete_newstack}
    Click Element                       ${delete_newstack}

    Wait Until Element Is Visible       ${delete_dialogbox}          timeout=10s
    Click Button                        ${delete_dialogbox}
    Wait Until Page Does Not Contain    new    timeout=5s
    Page Should Not Contain         new
Validate Rows Per Page Dropdown

    Click Element    ${drop_down}
    Click Element    ${drop_down_5}
    ${actual_count}=    Get Element Count    ${num_of_stacks}
    Should Be Equal As Integers    ${actual_count}    5

Validate Back Buton On Add New Slider Page
    Click Button    ${add_new_slider}
    Click Button    ${back_button}
    Wait Until Element Is Visible    ${assert_execution_slider}    timeout=10s
    Page Should Contain Element      ${assert_execution_slider}    