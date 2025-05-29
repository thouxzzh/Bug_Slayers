*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/WCUResources.robot
Resource    ../Resources/LoginResource.robot

*** Test Cases ***

Verify why we choose us page
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to menu
    Click Home and select why choose us
    Page Should Contain    Why Choose Us Panel

verify the user can add New WCU
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to menu
    Click Home and select why choose us
    click add new new WCU
    fill the form details
    click the submit WCU button
    close the browser session

Verify the user can search WCU
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to menu
    Click Home and select why choose us
    Search for the WCU
    Verify the search result   

Verify the user can delete the WCU seaction
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to menu
    Click Home and select why choose us
    Search for the WCU
    Verify the search result
    Delete the WCU
    
    
    