*** Settings ***
Library                                                        SeleniumLibrary
Suite Setup                                                    Set Selenium Speed        0.25s
Test Setup                                                     Open Add/Remove Element Page
Test Teardown                                                  Close Browser
Suite Teardown                                                 Close All Browsers

*** Variables ***
${url}                                                         https://the-internet.herokuapp.com/
${browser}                                                     chrome
${locator_add_remove_elm}                                      xpath=//*[@id="content"]/ul/li[2]/a
${verify_text}                                                 Add/Remove Elements
${locator_add_btn}                                             xpath=//*[@id="content"]/div/button
${locator_del_btn}                                             xpath=//*[@id="elements"]/button


*** Keywords ***
Open Add/Remove Element Page
    Open Browser                                               ${url}            ${browser}
    Maximize Browser Window
    Click Element                                              ${locator_add_remove_elm}
    Wait Until Page Contains                                   ${verify_text}            5s

Click Add
    Click Element                                              ${locator_add_btn}
    Wait Until Element Is Visible                              ${locator_del_btn}        5s

Click Delete
    Click Element                                              ${locator_del_btn}
    Wait Until Page Does Not Contain Element                   ${locator_del_btn}        5s


*** Test Cases ***
Add Element
    Click Add

Remove Element
    Click Add
    Click Delete