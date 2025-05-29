*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=D:/SmartCliff_Robot/Smartcliff_RobotFramework/Bug_Slayers/Utilities/RegDatas.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RegisterResources.robot
Resource    ../Resources/LoginResource.robot

*** Test Cases ***

# Verify logout feature
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers    
#     Verify the Home Page
#     click Logout
#     Verify the login Page
#     close the browser session

# Verify the Registration Page
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Wait Until Page Contains    Welcome    timeout=10s
#     Verify the Home Page
#     Go to user setting
#     Wait Until Page Contains    User Management    timeout=10s
    
# Search Admin Test
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Sleep    5
#     Verify the Home Page
#     Go to user setting
#     Search for the admin    bugslayers124@gmail.com        
#     Verify the admin in search result    BugTest Team 

# Edit the admin Details Test
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Sleep    5
#     Verify the Home Page
#     Go to user setting
#     Search for the admin    bugslayers124@gmail.com
#     Verify the admin in search result    BugTest Team
#     click edit icon and edit the information    test_edit
#     Verify the edited field    test_edit Team 

# Delete the Admin Test
#     Open the browser with url
#     Fill the login form    Bugslayers@gmail.com    Bugslayers
#     Sleep    5
#     Verify the Home Page
#     Go to user setting
#     Search for the admin    bugslayers124@gmail.com
#     Verify the admin in search result    test_edit Team
#     click and confirm the delete
#     verify the deletion of the user

Verify Rows per page Filter Option
    Open the browser with url
    Fill the login form    Bugslayers@gmail.com    Bugslayers
    Sleep    5
    Verify the Home Page
    Go to user setting
    click and select the rows per page
    verify the number of rows after filter
    

    
    

    