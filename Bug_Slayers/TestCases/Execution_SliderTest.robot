*** Settings ***
Documentation    Test to Validate the Execution Slider
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/Execution_SliderResources.robot
Resource    ../Resources/Validate_BackButton_ExecutionSliderResources.robot

*** Variables ***
${username}    Bugslayers@gmail.com
${password}    Bugslayers

*** Test Cases ***
Execute Execution Slider Test
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
Validate Edit Functionality
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Edit Button  
        
# Validate Edit Functionality Without Providing Stack
#     LoginResource.Fill the login form    ${username}    ${password}
#     Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
#     Execution_SliderResources.Navigate To Execution Slider
#     Execution_SliderResources.Validate Edit Functionality Without Providing Stack

Validate Search Functionality 
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Search Functionality  
    

Validate Search Functionality By Providing Unrelated Keyword
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Search Functionality By Providing Unrelated Keyword 

Validate Adding New Execution Slider
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Adding New Execution Slider
    
Validate Delete Button Functionality
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate the Delete Functionality
Validate Rows Per Page Drop Down Button
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Rows Per Page Dropdown   
Validate Back Button On the Add New Slider Page
    LoginResource.Fill the login form    ${username}    ${password}
    Wait Until Location Is    https://smart-cliff-admin.vercel.app/adminHome    timeout=15s
    Execution_SliderResources.Navigate To Execution Slider
    Execution_SliderResources.Validate Back Buton On Add New Slider Page


