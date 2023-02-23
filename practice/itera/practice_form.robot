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
${locator_monday}                  id=monday
${locator_dropdown}                xpath=/html/body/div/div[4]/div[2]/div/select

#Checkbox, Radio button Xpath
${locator_op_1}                    xpath=/html/body/div/div[5]/div[2]/div[1]/div[1]/label
${locator_selenium}                xpath=/html/body/div/div[5]/div[2]/div[2]/div[1]/label

#Upload file
${locator_upload}                  id=inputGroupFile02

*** Keywords ***
Open Web
    Open Browser                   ${url}            ${browser}
    Maximize Browser Window
    
Input textarea data
    Input Text                     ${locator_name}                    Sirawit
    Input Text                     ${locator_mobile_number}           0836563266
    Input Text                     ${locator_email}                   beer@gmail.com
    Input Text                     ${locator_password}                123456
    Input Text                     ${locator_address}                 666/236
    Click Element                  ${locator_submit_btn}

Select radio button and checkbox - basic
    Click Element                  ${locator_male}
    Select Checkbox                ${locator_monday}

Select choice in dropdown
    Select From List By Label      ${locator_dropdown}                Finland 

Select radio button and checkbox - xpath
    Click Element                  ${locator_op_1}                    
    Click Element                  ${locator_selenium}

Upload file
    Choose File                    ${locator_upload}                  ${CURDIR}/rb.jpg

*** Test Cases ***
Test automation practice form
    Input textarea data
    Select radio button and checkbox - basic
    Select choice in dropdown
    Select radio button and checkbox - xpath
    Upload file