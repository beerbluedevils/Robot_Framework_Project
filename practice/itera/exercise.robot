*** Settings ***
Library                    SeleniumLibrary
Suite Setup                Set Selenium Speed    0.25s
Test Setup                 Open Web
Test Teardown              Close Browser
Suite Teardown             Close All Browsers


*** Variables ***        
${url}                             https://itera-qa.azurewebsites.net/home/automation
${browser}                         Chrome
#Textarea Locator
${locator_name}                    id=name
${locator_mobile_number}           id=phone
${locator_email}                   id=email
${locator_password}                id=password
${locator_address}                 id=address
${locator_submit_btn}              name=submit

#Checkbox, Radio button Locator
${locator_male}                    id=male
${locator_tuesday}                 id=tuesday
${locator_friday}                  id=friday
${locator_dropdown}                xpath=/html/body/div/div[4]/div[2]/div/select

#Checkbox, Radio button Xpath
${locator_op_1}                    xpath=/html/body/div/div[5]/div[2]/div[1]/div[1]/label
${locator_op_2}                    xpath=/html/body/div/div[5]/div[2]/div[1]/div[2]/label
${locator_selenium}                xpath=/html/body/div/div[5]/div[2]/div[2]/div[1]/label

#Upload file
${locator_upload}                  id=inputGroupFile02

*** Keywords ***
Open Web
    Open Browser                   ${url}            ${browser}
    Maximize Browser Window

Textarea Practice
    Input Text                     ${locator_name}                Sirawit
    Input Text                     ${locator_mobile_number}       0836563266
    Input Text                     ${locator_email}               beer@gmail.com
    Input Text                     ${locator_password}            123456789
    Input Text                     ${locator_address}             666/236
    Click Element                  ${locator_submit_btn}

CheckBox & Radio Button practice
    Click Element                  ${locator_male}
    Select Checkbox                ${locator_tuesday}
    Select Checkbox                ${locator_friday}

DropDown practice
    Select From List By Label      ${locator_dropdown}            Norway

CheckBox & Radio Button practice - Xpath
    Click Element                  ${locator_op_2}
    Click Element                  ${locator_selenium}


*** Test Cases ***
TC-1 Exercise 1
    Textarea Practice

TC-2 Exercise 2
    CheckBox & Radio Button practice

TC-3 Exercise 3
    DropDown practice

TC-4 Exercise 4
    CheckBox & Radio Button practice - Xpath
    
    

    
