*** Settings ***
Library                            SeleniumLibrary
Suite Setup                        Set Selenium Speed    0.5s
Test Setup                         Open URL
Test Teardown                      Close Browser


*** Variables ***
${url}                             https://the-internet.herokuapp.com/dynamic_controls
${browser}                         Chrome
#Checkbox
${locator_checkbox}                xpath=//*[@id="checkbox"]/input
${locator_checkbox1}               id=checkbox
${locator_checkbox_elm}            xpath=//*[@id="checkbox-example"]/div/input
${locator_add_or_remove_btn}       xpath=//*[@id="checkbox-example"]//button
${locator_load_bar}                id=loading
${locator_text_notice}             id=message

#Field
${locator_input_field}             xpath=//*[@id="input-example"]/input
${locator_field_btn}               xpath=//*[@id="input-example"]/button
${locator_text_notice2}            xpath=//*[@id="input-example"]/p
${locator_load_bar2}               xpath=//*[@id="input-example"]/div

*** Keywords ***
Open URL
    Open Browser                   ${url}            ${browser}
    Maximize Browser Window

Tick on checkbox
    Select Checkbox                ${locator_checkbox}

Click remove button
    Click Element                  ${locator_add_or_remove_btn} 
    Wait Until Element Is Visible  ${locator_load_bar}        5s 
    Wait Until Element Contains    ${locator_text_notice}     It's gone!    5s

Click add button
    Click remove button
    Click Element                  ${locator_add_or_remove_btn}
    Wait Until Element Contains    ${locator_text_notice}     It's back!    5s
    Page Should Contain Element    ${locator_checkbox_elm}

Tick on another checkbox 
    Click add button 
    Select Checkbox                ${locator_checkbox1}

Verify field input
    Element Should Be Disabled     ${locator_input_field}

Click enable button
    Click Element                  ${locator_field_btn}
    Wait Until Element Is Visible  ${locator_load_bar2}
    Wait Until Element Contains    ${locator_text_notice2}    It's enabled!    5s
    Element Should Be Enabled      ${locator_input_field}

Input text in field
    Click enable button
    Input Text                     ${locator_input_field}    Test Input

Click disable button
    Click enable button            
    Click Element                  ${locator_field_btn}
    Wait Until Element Is Visible  ${locator_load_bar2}
    Wait Until Element Contains    ${locator_text_notice2}    It's disabled!    5s
    Element Should Be Disabled     ${locator_input_field}


*** Test Cases ***
Tick checkbox
    Tick on checkbox

Verify remove button
    Click remove button

Verify add button
    Click add button

Tick checkbox after click add button
    Tick on another checkbox

Verify disable input field
    Verify field input

Enable field
    Click enable button

Verify input text
    Input text in field

Disable input field
    Click disable button
    



    