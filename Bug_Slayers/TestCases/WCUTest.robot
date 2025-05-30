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
    Verify the WCU is added in WCU panel
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

Verify the user can edit WCU fields
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to menu
    Click Home and select why choose us
    Click edit icon
    Edit the fields with new value and click update    edited_description
    Verify the new Values got updated in WCU fields    edited_description    
    

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
    
    
    