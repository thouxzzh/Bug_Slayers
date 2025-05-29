ExecutionCount1Test
*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/A_TestimonialsResources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/Testimonials1Resources.robot

*** Test Cases ***
Verify the Navigation in Testimonial Panel
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Testimonials Overview
    Navigate to the Testimonial Add Form
    Back to the Testimonials Overview
    Close the browser session

Verify the Search in Testimonial Panel
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Testimonials Overview
    Search for the element in Testimonial Overview
    close the browser session

Edit the Element in Testimonial Panel
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Testimonials Overview
    Search for the element in Testimonial Overview
    Edit the element in Testimonial
    close the browser session

# Verify Pagination Options
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Navigate to the Executive Count
#     Verify Pagination Row Count    5
#     close the browser session

# Delete the Executive Count Panel
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Navigate to the Executive Count
#     Search for the element in Navigation
#     Delete the element in Executive Count
#     close the browser session



