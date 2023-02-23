*** Settings ***
Library                                SeleniumLibrary
Suite Setup                            Set Selenium Speed    0.5s
Test Setup                             Open URL
Test Teardown                          Close Browser
Suite Teardown                         Close All Browsers

*** Variables ***
${url}                                 https://the-internet.herokuapp.com/checkboxes
${browser}                             Chrome
${locator_checkbox1}                   xpath=//*[@id='checkboxes']/input[1]
${locator_checkbox2}                   xpath=//*[@id='checkboxes']/input[2]
${locator_image}                       xpath=//a/img
${locator_hyperlink}                   xpath=//div[a[text()="Elemental Selenium"]]

*** Keywords ***
Open URL
    Open Browser                       ${url}        ${browser}
    Maximize Browser Window
    Click Element                      ${locator_checkbox2}

Select Checkbox Using Xpath
    [Arguments]    ${checkbox_number}
    Open URL
    IF  ${checkbox_number} == 1
        Select Checkbox                 ${locator_checkbox1}
    ELSE IF    ${checkbox_number} == 2
        Select Checkbox                 ${locator_checkbox1}
        Select Checkbox                 ${locator_checkbox2}
    END
    Close Browser

Click Image Element
    Click Element                       ${locator_image}
    Wait Until Page Contains            the-internet

Click Hyperlink
    Click Element                       ${locator_hyperlink}
    Switch Window                       title=Elemental Selenium: Receive a Free, Weekly Tip on Using Selenium like a Pro
    Wait Until Page Contains            Elemental Selenium
    
*** Test Cases ***
Verify Web URL
    Wait Until Page Contains            Checkboxes    5s

Verify Checkboxes
    [Template]    Select Checkbox Using Xpath
    [Setup]
    1
    2
    [Teardown]

Verify Image Element
    Click Image Element

Verify Hyperlink
    Click Hyperlink                     