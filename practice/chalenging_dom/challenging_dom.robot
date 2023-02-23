*** Settings ***
Library                         SeleniumLibrary
Suite Setup                     Set Selenium Speed  0.25s
Test Setup                      Open Web
Test Teardown                   Close Browser
Suite Teardown                  Close All Browsers

*** Variables ***
${url}                          https://the-internet.herokuapp.com/challenging_dom
${browser}                      Chrome
${image}                        xpath=//a/img
${locator_challenging_dom}      xpath=//*[@id="content"]/ul/li[5]/a
${locator_1st_btn}              xpath=//div[@class='large-2 columns']/a[1]
${locator_2nd_btn}              xpath=//div[@class='large-2 columns']/a[2]
${locator_3th_btn}              xpath=//div[@class='large-2 columns']/a[3]
${locator_row1_edit}            xpath=//tr[1]/td[7]/a[text()="edit"]
${locator_row1_delete}          xpath=//tr[1]/td[7]/a[text()="delete"]
${locator_row2_edit}            xpath=//tr[2]/td[7]/a[text()="edit"]
${locator_row2_delete}          xpath=//tr[2]/td[7]/a[text()="delete"]
${locator_row3_edit}            xpath=//tr[3]/td[7]/a[text()="edit"]
${locator_row3_delete}          xpath=//tr[3]/td[7]/a[text()="delete"]
${locator_row4_edit}            xpath=//tr[4]/td[7]/a[text()="edit"]
${locator_row4_delete}          xpath=//tr[4]/td[7]/a[text()="delete"]
${locator_row5_edit}            xpath=//tr[5]/td[7]/a[text()="edit"]
${locator_row5_delete}          xpath=//tr[5]/td[7]/a[text()="delete"]
${locator_row6_edit}            xpath=//tr[6]/td[7]/a[text()="edit"]
${locator_row6_delete}          xpath=//tr[6]/td[7]/a[text()="delete"]
${locator_row7_edit}            xpath=//tr[7]/td[7]/a[text()="edit"]
${locator_row7_delete}          xpath=//tr[7]/td[7]/a[text()="delete"]
${locator_row8_edit}            xpath=//tr[8]/td[7]/a[text()="edit"]
${locator_row8_delete}          xpath=//tr[8]/td[7]/a[text()="delete"]
${locator_row9_edit}            xpath=//tr[9]/td[7]/a[text()="edit"]
${locator_row9_delete}          xpath=//tr[9]/td[7]/a[text()="delete"]
${locator_row10_edit}           xpath=//tr[10]/td[7]/a[text()="edit"]
${locator_row10_delete}         xpath=//tr[10]/td[7]/a[text()="delete"]
${locator_footer_link}          xpath=//div//a[text()="Elemental Selenium"]

*** Keywords ***
Open Web
    Open Browser                ${url}            ${browser}
    Maximize Browser Window

Click Image Element
    Click Element               ${image}
    Wait Until Page Contains    The Internet 0.58.0

Click Button - Xpath 
    [Arguments]    ${button}
    Open Web
    Click Element               ${button}
    Close Browser

Click Element In The Table - Xpath Locator
    [Arguments]    ${edit}    ${delete}
    Open Web
    Click Element               ${edit}
    Click Element               ${delete}
    Close Browser

Click Footer Link
    Click Element               ${locator_footer_link}
    Switch Window               title=Elemental Selenium: Receive a Free, Weekly Tip on Using Selenium like a Pro
    Wait Until Page Contains    Elemental Selenium           

*** Test Cases ***
Verify Webpage
    [Documentation]    Verify URL
    [Tags]             Default Page
    Wait Until Page Contains    Challenging DOM            5s

Verify Image Element
    [Documentation]    Test for click image element
    [Tags]             Image
    Click Image Element

Veriy Button - Xpath Locator
    [Documentation]    Test for click element by using xpath locator and specific text inside tag
    [Tags]             Button
    [Template]                  Click Button - Xpath
    [Setup]
    ${locator_1st_btn} 
    ${locator_2nd_btn} 
    ${locator_3th_btn} 
    [Teardown]

Verify Click Element In A Table
    [Documentation]    Test for click element in a table by using xpath locator and specific row, text inside tag
    [Tags]             Table
    [Template]                  Click Element In The Table - Xpath Locator
    [Setup]
    ${locator_row1_edit}        ${locator_row1_delete} 
    ${locator_row2_edit}        ${locator_row2_delete}
    ${locator_row3_edit}        ${locator_row3_delete}
    ${locator_row4_edit}        ${locator_row4_delete}
    ${locator_row5_edit}        ${locator_row5_delete}
    ${locator_row6_edit}        ${locator_row6_delete}
    ${locator_row7_edit}        ${locator_row7_delete}
    ${locator_row8_edit}        ${locator_row8_delete}
    ${locator_row9_edit}        ${locator_row9_delete}
    ${locator_row10_edit}       ${locator_row10_delete}
    [Teardown]

Verify Footer Hyperlink
    [Documentation]    Test for click hyperlink on the footer
    [Tags]    Footer
    Click Footer Link
