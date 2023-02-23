*** Settings ***
Library                        SeleniumLibrary
Suite Setup                    Set Selenium Speed    0.5s
Test Setup                     Open URL
Test Teardown                  Close Browser
Suite Teardown                 Close All Browsers

*** Variables ***
${url}                         https://the-internet.herokuapp.com/context_menu
${browser}                     Chrome
${locator_image}               xpath=//a/img
${locator_hot_spot}            id=hot-spot
${locator_hyperlink}           xpath=//div//a[text()="Elemental Selenium"]

*** Keywords ***
Open URL
    Open Browser               ${url}            ${browser}
    Maximize Browser Window

Click Image Element
    Click Element              ${locator_image}
    Wait Until Page Contains   About


Right-Click On Hot-Spot
    Open Context Menu          ${locator_hot_spot}

Click OK - Alert
    Alert Should Be Present    You selected a context menu

Click Hyperlink
    Click Element              ${locator_hyperlink}
    Switch Window              title=Elemental Selenium: Receive a Free, Weekly Tip on Using Selenium like a Pro
    Wait Until Page Contains   Elemental Selenium

*** Test Cases ***
Verify Web URL
    Wait Until Page Contains   Context Menu

Verify Image Element
    Click Image Element

Verify Right Click On Hot-Spot
    Right-Click On Hot-Spot
    Click OK - Alert

Verify Hyperlink Element
    Click Hyperlink