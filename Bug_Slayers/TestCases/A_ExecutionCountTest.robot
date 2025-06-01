*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Utilities/Executioncount.csv    encoding=utf_8    dialect=unix  
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/A_ExecutionCountResources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/ExecutionCount1Resources.robot


*** Test Cases ***
Verify Execution count
    [Tags]    sanity
    [Template]    Verify Execution Count Functionality
    ${count}    ${service}    ${slug}

*** Keywords ***

Verify Execution Count Functionality
    [Arguments]    ${count}    ${service}    ${slug}
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Verify the Navigation
    Fill The Execution Count Add Form    ${count}    ${service}    ${slug}
    IF    '${count}'=="" or '${service}'=="" or '${slug}'==""
        Location Should Be    https://smart-cliff-admin.vercel.app/home/service-count-add
    ELSE
        Verify The Execution    ${service}
    END
    Close the browser session


