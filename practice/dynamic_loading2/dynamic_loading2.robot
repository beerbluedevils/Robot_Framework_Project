*** Settings ***
Library                                    SeleniumLibrary
Suite Setup                                Set Selenium Speed    0.5s

*** Variables ***
${url}                                     https://the-internet.herokuapp.com/dynamic_loading/2
${browser}                                 Chrome
${locator_start_btn}                       xpath=//*[@id="start"]/button
${locator_load_bar}                        id=loading
${locator_hidden_text}                     xpath=//*[@id="finish"]/h4

*** Keywords ***
Open URL
    #Open web browser with target URL
    Open Browser                           ${url}            ${browser}
    #Maximize the window size to full screen
    Maximize Browser Window

Click Start
    #Click start button on the page
    Click Element                          ${locator_start_btn}
    #Verify the load bar element should visible
    Element Should Be Visible              ${locator_load_bar}        Loading... 
    #Verify load bar should not visisble to show the hidden text
    Wait Until Element Is Not Visible      ${locator_load_bar}        5s

Verify hidden text
    #Verify the hidden text element should contains on the website
    Page Should Contain Element            ${locator_hidden_text}     Hello World!
    #Verify load bar should not be visible
    Element Should Not Be Visible          ${locator_load_bar}

*** Test Cases ***
Show hidden text
    Open URL
    Click Start
    Verify hidden text
    Close Browser

