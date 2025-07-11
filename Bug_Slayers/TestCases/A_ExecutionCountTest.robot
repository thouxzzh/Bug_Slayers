A_ExecutionCountTest
*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Utilities/Executioncount.csv    encoding=utf_8    dialect=unix  
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/A_ExecutionCountResources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/ExecutionCount1Resources.robot


*** Test Cases ***
Verify Execution count
    [Template]    Verify Execution Count Functionality
    ${count}    ${service}    ${slug}

*** Keywords ***

Verify Execution Count Functionality
    [Arguments]    ${count}    ${service}    ${slug}
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5s
    Verify the Navigation
    Fill The Execution Count Add Form    ${count}    ${service}    ${slug}
    Sleep     5s
    Verify The Execution    ${service}
    Sleep     5s
    Close the browser session