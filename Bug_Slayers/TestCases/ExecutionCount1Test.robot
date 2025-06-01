ExecutionCount1Test
*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/GenericResources.robot
Resource          ../Resources/A_ExecutionCountResources.robot
Resource          ../Resources/LoginResource.robot
Resource          ../Resources/ExecutionCount1Resources.robot

*** Test Cases ***
Verify the Navigation in Execution Count Panel
    [Tags]    smoke
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Verify the Navigation 
    Close the browser session

Verify the Search in Execution Count Panel
    [Tags]    sanity
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
    Search for the element in Navigation
    close the browser session

Edit the Executive Count Panel
    [Tags]    regression
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
    Search for the element in Navigation
    Edit the element in Executive Count
    close the browser session

Verify Pagination Options
<<<<<<< HEAD
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
    Verify Pagination Row Count    5
    close the browser session

Delete the Executive Count Panel
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
=======
    [Tags]    regression
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
    Verify Pagination Row Count    5
    close the browser session

Delete the Executive Count Panel
    [Tags]    regression
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Navigate to the Executive Count
>>>>>>> bec019ebc1d929a8bf3645fee54888b46eb957e0
    Search for the element in Navigation
    Delete the element in Executive Count
    close the browser session



