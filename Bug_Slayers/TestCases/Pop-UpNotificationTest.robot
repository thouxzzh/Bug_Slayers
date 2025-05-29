*** Settings ***
Documentation    Test to Validate the Pop Up Notification Panel
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/Pop-UpNotificationResources.robot

*** Variables ***
${username}    Bugslayers@gmail.com
${password}    Bugslayers

*** Test Cases ***
Execute Execution Slider Test
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel

    
Validate Edit Functionality
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    Pop-UpNotificationResources.Validate Edit Functionality    
Validate Search Functionality
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    Pop-UpNotificationResources.Validate Search Functionality   
Validate Rows Per Page Dropdown Functionality
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    Pop-UpNotificationResources.Validate Rows Per Page Dropdown
Validate Toggle Button Disabled After Clicking
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    Pop-UpNotificationResources.Validate Toggle Checkboxes Are Disabled After Click    

Validate Toggle Button Enabled After Clicking
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Pop-UpNotificationResources.Navigate To Pop Up Notification Panel
    Pop-UpNotificationResources.Validate Toggle Checkboxes Are Enabled After Click        
