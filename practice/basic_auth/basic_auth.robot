*** Settings ***
Library                            SeleniumLibrary
Suite Setup                        Set Selenium Speed        0.5s

*** Variables ***
${url}                             https://the-internet.herokuapp.com/basic_auth
${browser}                         Chrome
${valid_username}                  admin
${valid_password}                  admin

*** Keywords ***
Open Auth Page
    Open Browser                   ${url}            ${browser}
    Maximize Browser Window

Input Valid Data
    Go To                          http://${valid_username}:${valid_username}@the-internet.herokuapp.com/basic_auth
    Wait Until Page Contains       Congratulations!      

*** Test Cases ***
Authentication Test
    Open Auth Page
    Input Valid Data
    Close Browser
