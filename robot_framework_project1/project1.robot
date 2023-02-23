*** Settings ***
Library                        SeleniumLibrary
Resource                       ${CURDIR}/variables.robot
Resource                       ${CURDIR}/keywords.robot
Suite Setup                    Set Selenium Speed        0.15s
Test Setup                     Open Web And Login
Test Teardown                  Close Browser
Suite Teardown                 Close All Browsers

*** Test Cases ***
TC-01 Notification Icon
    [Documentation]    Test for notice modal
    [Tags]    Header
    Click Notification Icon

TC-02 User Icon
    [Documentation]    Test for user modal
    [Tags]    Header
    Click User Icon

TC-03 Clear Filter
    [Documentation]    Test for clear data
    [Tags]    Search Filters
    Click Clear Button

TC-04 Search Filter
    [Documentation]    Apply various search options
    [Tags]    Search Filters
    [Template]    Apply Search Filter
    1
    2
    3
    4
    5
    6
    7
   

TC-05 Change Rows Per Page
    [Documentation]    Test for change the amount of rows per page
    [Tags]    Search Filters
    Row Per Page

TC-06 Next And Back
    [Documentation]    Test for next and  back button
    [Tags]    Search Filters
    Next And Back Button

TC-07 Go To Top Of The Page
    [Documentation]    Test for go to top button
    [Tags]    Search Filters
    Go To Top - Search

TC-08 Add User Button
    [Documentation]    Test for redirect to register page
    [Tags]    User 
    Add User

TC-09 Back To Search Filters
    [Documentation]    Test for go back from register page to search page
    [Tags]    Resgister Page
    Back Button

TC-10 User Tab
    [Documentation]    Test for click user tab and go to search page
    [Tags]    Register Page
    Click User Tab

TC-11 Logout 
    [Documentation]    Test for logout from search page
    [Tags]    Header
    Logout

TC-12 Input Data Pass
    [Documentation]    Test input for register new user
    [Tags]    Register Page
    Input Data Pass - Register

TC-13 Input Data and Reset
    [Documentation]    Test for clear input in register page
    [Tags]    Register Page
    Input Data And Reset

TC-14 Go To Top On Register Page
    [Documentation]    Test for go to top on register page
    [Tags]    Register Page
    Go To Top - Register

TC-15 Input Data Failed
    [Documentation]    Test for input invalid data for register page
    [Tags]    Register Page
    [Template]    Input Data Failed - Register
    [Setup]
    ${EMPTY}    Prompet    beer@gmail.com    beer1234    0836563266    male    4    1    1    1    ${locator_fn_err}             This field is required
    Sirawit     ${EMPTY}   beer@gmail.com    beer1234    0836563266    male    4    1    1    1    ${locator_ln_err}             This field is required
    Sirawit     Prompet    ${EMPTY}          beer1234    0836563266    male    4    1    1    1    ${locator_email_err}          This field is required
    Sirawit     Prompet    beer@gmail.com    ${EMPTY}    0836563266    male    4    1    1    1    ${locator_pw_err}             This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    ${EMPTY}      male    4    1    1    1    ${locator_mobile_err}         This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    0836563266    none    4    1    1    1    ${locator_gender_err}         This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    0836563266    male    0    1    1    1    ${locator_course_err}         This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    0836563266    male    4    0    1    1    ${locator_nationality_err}    This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    0836563266    male    4    1    0    1    ${locator_role_err}           This field is required
    Sirawit     Prompet    beer@gmail.com    beer1234    0836563266    male    4    1    1    0    ${locator_plan_err}           This field is required
    Sirawit     Prompet    beermkpvksd       beer1234    0836563266    male    4    1    1    1    ${locator_email_err}          Invalid email address 
    [Teardown]





    