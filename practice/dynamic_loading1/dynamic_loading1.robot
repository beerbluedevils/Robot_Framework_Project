*** Settings ***
Library                                    SeleniumLibrary
Suite Setup                                Set Selenium Speed    0.5s

*** Variables ***
${url}                                     https://the-internet.herokuapp.com/dynamic_loading/1
${browser}                                 Chrome
${locator_start_btn}                       xpath=//*[@id="start"]/button
${locator_load_bar}                        id=loading
${locator_finish_text}                     xpath=//*[@id="finish"]/h4


*** Keywords ***
#This keyword use for open the target URL
Open URL
    Open Browser                           ${url}            ${browser}
    Maximize Browser Window

Click Start
    #Click start button on the page
    Click Element                          ${locator_start_btn}
    #Verify load bar should visible
    Element Should Be Visible              ${locator_load_bar}
    #Wait until load bar is not visible to show the hidden text
    Wait Until Element Is Not Visible      ${locator_load_bar}    5s

Verify hidden text   
    #Verify element should contain hidden text "Hello World!"
    Element Should Contain                 ${locator_finish_text}        Hello World!
    #Verify load bar should not be visible after the text shown
    Element Should Not Be Visible          ${locator_load_bar} 

*** Test Cases ***
Show hidden text
    Open URL
    Click Start
    Verify hidden text
    Close Browser

