*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Utilities/Executioncount.csv    encoding=utf_8    dialect=unix  
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/ExecutionCountResources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/ExecutionCount1.robot


*** Test Cases ***
Verify Execution count
    [Template]    Verify Execution Count Functionality
    ${count}    ${service}    ${slug}

*** Keywords ***

Verify Execution Count Functionality
    [Arguments]    ${count}    ${service}    ${slug}
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Verify the Navigation
    Fill The Execution Count Add Form    ${count}    ${service}    ${slug}
    Verify The Execution    ${service}
    Close the browser session



