*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Utilities/Testimonials.csv    encoding=utf_8    dialect=unix
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/Testimonials1Resources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/A_TestimonialsResources.robot

*** Test Cases ***
Verify Testimonial Functionality
<<<<<<< HEAD
=======
    [Tags]    sanity
>>>>>>> bec019ebc1d929a8bf3645fee54888b46eb957e0
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
    Search for the element in Testimonial Overview
    Close the browser session
