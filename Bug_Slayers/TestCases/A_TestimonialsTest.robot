*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Utilities/Testimonials.csv    encoding=utf_8    dialect=unix
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/Testimonials1Resources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/A_TestimonialsResources.robot

*** Test Cases ***
Verify Testimonial Functionality
    [Template]    Verify Testimonial Functionality With Data
    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}   

*** Keywords ***
Verify Testimonial Functionality With Data
    [Arguments]    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}   
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Testimonials Overview
    Navigate to the Testimonial Add Form
    Fill The Testimonial Data Form    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}   
    Sleep    5s
    Search for the element in Testimonial Overview
    Sleep    5s
    Close the browser session
