*** Settings ***
Library                    SeleniumLibrary
Resource                   ${CURDIR}/variables.robot


*** Keywords ***
Open Web And Login
    Open Browser                               ${url}                   ${browser}
    Maximize Browser Window
    Login                                      ${locator_email}    user.test@krupbeam.com    ${locator_password}    123456789    Search Filter

Login
    [Arguments]    ${locator1}    ${email}    ${locator2}    ${password}    ${verify_text}
    Input Text                                 ${locator1}              ${email}                 
    Input Text                                 ${locator2}              ${password}
    Click Element                              ${locator_login_btn}
    Wait Until Page Contains                   ${verify_text}

Logout
    Click User Icon
    Click Element                              ${locator_logout}
    Wait Until Page Contains                   Welcome to Kru P' Beam!

Click Notification Icon
    Click Element                              ${locator_notice_icon}
    Wait Until Page Contains Element           ${locator_modal}        

Click User Icon
    Click Element                              ${locator_profile_icon}
    Wait Until Page Contains Element           ${locator_modal}        

Dropdown Role
    Wait Until Element Is Visible              ${locator_select_role}        
    Click Element                              ${locator_select_role}
    Wait Until Element Is Visible              ${locator_admin_option}
    Click Element                              ${locator_admin_option}

Dropdown Plan
    Wait Until Element Is Visible              ${locator_select_plan}
    Click Element                              ${locator_select_plan}
    Wait Until Element Is Visible              ${locator_basic_option}
    Click Element                              ${locator_basic_option}

Dropdown Status
    Wait Until Element Is Visible              ${locator_select_status}
    Click Element                              ${locator_select_status}
    Wait Until Element Is Visible              ${locator_pending_option}
    Click Element                              ${locator_pending_option}

Click Clear Button
    Dropdown Role
    Dropdown Plan
    Dropdown Status
    Click Element                              ${locator_search_btn}
    Wait Until Element Is Visible              ${locator_user_list}        
    Click Element                              ${locator_clear_btn}

Add User
    Wait Until Page Contains                   Search Filter
    Click Element                              ${locator_add_user_btn}
    Wait Until Page Contains                   Form User

Back Button
    Add User
    Wait Until Element Is Visible              ${locator_back_btn}
    Click Element                              ${locator_back_btn}
    Wait Until Page Contains                   Search Filter

Select Nationality
    Wait Until Element Is Visible              ${locator_nationality}
    Click Element                              ${locator_nationality}
    Wait Until Element Is Visible              ${locator_thai}
    Click Element                              ${locator_thai}               

Select Role
    Wait Until Element Is Visible              ${locator_select_role}
    Click Element                              ${locator_select_role}
    Wait Until Element Is Visible              ${locator_role_admin}
    Click Element                              ${locator_role_admin}

Select Plan
    Wait Until Element Is Visible              ${locator_select_plan}
    Click Element                              ${locator_select_plan}
    Wait Until Element Is Visible              ${locator_basic}
    Click Element                              ${locator_basic}

Apply Search Filter
    [Arguments]    ${case}
    IF  ${case} == 1
        Dropdown Role   
    ELSE IF    ${case} == 2
        Dropdown Plan
    ELSE IF    ${case} == 3
        Dropdown Status
    ELSE IF    ${case} == 4
        Dropdown Role
        Dropdown Plan
    ELSE IF    ${case} == 5
        Dropdown Role
        Dropdown Status
    ELSE IF    ${case} == 6
        Dropdown Plan
        Dropdown Status
    ELSE IF    ${case} == 7
        Dropdown Role
        Dropdown Plan
        Dropdown Status
    END
    Click Element                              ${locator_search_btn}
    Wait Until Element Is Visible              ${locator_user_list}
    Click Element                              ${locator_clear_btn}
    

Input Data Pass - Register
    Add User
    Input Text                                  ${locator_firstname}          Sirawit
    Input Text                                  ${locator_lastname}           Prompet
    Input Text                                  ${locator_email}              beerbluedevils@gmail.com
    Input Text                                  ${locator_password_register}  beer1234
    Input Text                                  ${locator_mobile}             0836563266
    Select Radio Button                         ${locator_gender}             male
    Select Checkbox                             ${locator_sql}
    Select Nationality
    Select Role
    Select Plan
    Click Element                               ${locator_signup_button}
    Wait Until Page Contains                    Register Success
    Close Browser

Input Data Failed - Register
    [Arguments]    ${fname}    ${lname}    ${email}    ${password}    ${mobile}    ${gender}    ${course}    ${nationality}    ${role}    ${plan}    ${locator_err_msg}    ${msg} 
    Open Web And Login
    Add User
    Input Text                                 ${locator_firstname}            ${fname}
    Input Text                                 ${locator_lastname}             ${lname}
    Input Text                                 ${locator_email}                ${email}
    Input Text                                 ${locator_password_register}    ${password}
    Input Text                                 ${locator_mobile}               ${mobile}
    IF  '${gender}' != 'none'
        Select Radio Button                    ${locator_gender}               ${gender}
    END
    IF  ${course} == 1
        Select Checkbox                        ${locator_sql}
    ELSE IF    ${course} == 2   
        Select Checkbox                        ${locator_sql}
        Select Checkbox                        ${locator_test_manual}
    ELSE IF    ${course} == 3   
        Select Checkbox                        ${locator_sql}
        Select Checkbox                        ${locator_test_manual}
        Select Checkbox                        ${locator_automate_test}
    ELSE IF    ${course} == 4  
        Select Checkbox                        ${locator_sql}
        Select Checkbox                        ${locator_test_manual}
        Select Checkbox                        ${locator_automate_test}  
        Select Checkbox                        ${locator_automate_test2}
    END
    IF  ${nationality} == 1
        Select Nationality
    END
    IF  ${role} == 1
        Select Role
    END
    IF  ${plan} == 1
        Select Plan
    END
    Click Element                              ${locator_signup_button}
    Verify Error Message                       ${locator_err_msg}        ${msg}
    Close Browser

Verify Error Message
    [Arguments]    ${locator}    ${text}=${EMPTY}
    ${msg} =    Get Text                       ${locator}
    Should Be Equal As Strings                 ${msg}        ${text}           
    
Input Data And Reset
    Add User
    Input Text                               ${locator_firstname}          Sirawit
    Click Element                            ${locator_reset}
    ${msg}=    Get Text                      ${locator_firstname}
    Should Be Equal As Strings               ${msg}            ${EMPTY}

Click User Tab
    Add User
    Wait Until Element Is Visible            ${locator_user_tab}
    Click Element                            ${locator_user_tab}
    Wait Until Page Contains                 Search Filters

Go To Top - Search
    Click Element                            ${locator_search_btn}
    Scroll Element Into View                 ${locator_footer}
    Click Element                            ${locator_rows}
    Click Element                            ${locator_50}
    Scroll Element Into View                 ${locator_footer}
    Wait Until Element Is Visible            ${locator_go_top}
    Click Element                            ${locator_go_top}
    Wait Until Page Contains                 Search Filters

Go To Top - Register
    Add User
    Scroll Element Into View                ${locator_footer}
    Click Element                           ${locator_go_top}
    Wait Until Page Contains                Kru P' Beam

Row Per Page
    Click Element                            ${locator_search_btn}
    Scroll Element Into View                 ${locator_footer}
    Click Element                            ${locator_rows}
    Wait Until Element Is Visible            ${locator_10}
    Click Element                            ${locator_10}
    ${text1}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text1}        1–10 of 53
    Click Element                            ${locator_rows}
    Wait Until Element Is Visible            ${locator_25}
    Click Element                            ${locator_25}
    Scroll Element Into View                 ${locator_footer}
    ${text2}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text2}        1–25 of 53
    Click Element                            ${locator_rows}
    Wait Until Element Is Visible            ${locator_50}
    Click Element                            ${locator_50}
    Scroll Element Into View                 ${locator_footer}
    ${text3}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text3}        1–50 of 53

Next And Back Button
    Click Element                            ${locator_search_btn}
    Scroll Element Into View                 ${locator_footer}
    Wait Until Page Contains                 gslixby0@krupbeam.com
    ${text1}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text1}        1–10 of 53
    Click Element                            ${locator_next}
    Wait Until Page Contains                jwharltona@krupbeam.com
    ${text2}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text2}        11–20 of 53
    Click Element                            ${locator_back}
    Wait Until Page Contains                 gslixby0@krupbeam.com
    ${text1}=    Get Text                    ${locator_label}
    Should Be Equal As Strings               ${text1}        1–10 of 53




    
