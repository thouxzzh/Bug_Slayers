*** Settings ***
Documentation    Test to Validate Adding new pop up notification
Library    SeleniumLibrary
Library    DataDriver    file=../Utilities/PopUp.csv    encoding=utf_8    dialect=unix
Test Template    Validate the Adding New Pop Up Notification Panel
Test Setup    Open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/Pop-UpNotificationResources.robot

*** Variables ***
${username}    Bugslayers@gmail.com
${password}    Bugslayers
${Tit} 
${Descrp}    
${Button}    
${Linkk}


*** Test Cases ***
Validate the Adding New Pop Up Notification Panel    ${Tit}    ${Descrp}    ${Button}    ${Linkk}


*** Keywords ***
Validate the Adding New Pop Up Notification Panel
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    [Arguments]    ${Tit}    ${Descrp}    ${Button}    ${Linkk}
    Pop-UpNotificationResources.Validate Adding New Pop Up Notification Panel    ${Tit}    ${Descrp}    ${Button}    ${Linkk}         
    Pop-UpNotificationResources.Validate the Delete Functionality          
    