*** Settings ***
Library           SeleniumLibrary
# Library           DataDriver    file=../Utilities/Executioncount.csv    encoding=utf_8    dialect=unix  
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/Testimonials1Resources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/A_TestimonialsResources.robot


*** Test Cases ***
# Verify Execution count
#     [Template]    Verify Execution Count Functionality
#     ${count}    ${service}    ${slug}

# *** Keywords ***


Verify Testimonial Functionality
    ${Name}=       Set Variable    John 
    ${Ratings}=    Set Variable    5
    ${Batch}=      Set Variable    Gayu
    ${Role}=       Set Variable    QA Engineer
    ${Review}=     Set Variable    Excellent experience and support.

    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Testimonials Overview
    Navigate to the Testimonial Add Form
    Fill The Testimonial Data Form    ${Name}    ${Ratings}    ${Batch}    ${Role}    ${Review}
    Verify The Testimonial Data       ${Name}
    Sleep    5s
    Close the browser session

