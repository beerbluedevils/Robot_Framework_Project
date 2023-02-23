*** Settings ***
Library                            SeleniumLibrary
Suite Setup                        Set Selenium Speed    0.5s

*** Test Cases ***
Select Drop Down - Index
    Open Browser                   https://the-internet.herokuapp.com/dropdown        Chrome
    Select From List By Index      id=dropdown            0
    Close Browser

Select Drop Down - Value
    Open Browser                   https://the-internet.herokuapp.com/dropdown        Chrome
    Select From List By Value      id=dropdown            1
    Close Browser

Select Drop Down - Label
    Open Browser                   https://the-internet.herokuapp.com/dropdown        Chrome
    Select From List By Label      id=dropdown            Option 1
    Close Browser



