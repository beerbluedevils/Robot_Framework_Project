*** Settings ***
Library                            SeleniumLibrary
Suite Setup                        Set Selenium Speed        0.5s

*** Variables ***
${url}                             https://the-internet.herokuapp.com/drag_and_drop
${browser}                         Chrome
${locator_box_a}                   id=column-a
${locator_box_b}                   id=column-b

*** Keywords ***
Open URL
    Open Browser                   ${url}            ${browser}
    Maximize Browser Window

Move A To B
    Wait Until Element Is Visible  ${locator_box_a}
    Drag And Drop                  ${locator_box_a}            ${locator_box_b}  

Move B To A
    Wait Until Element Is Visible  ${locator_box_b}
    Drag And Drop                  ${locator_box_b}            ${locator_box_a}

*** Test Cases ***
Drag A To B
    Open URL
    Move A To B
    Close Browser

Drag B To A
    Open URL
    Move B To A 
    Close Browser