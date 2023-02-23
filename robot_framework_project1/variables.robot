*** Settings ***
Library                    SeleniumLibrary

*** Variables ***
#Login page locator
${locator_email}                id=email
${locator_password}             name=password
${locator_login_btn}            id=btn-login
${url}                          https://automate-test.stpb-digital.com/login/
${browser}                      chrome

#Search page locator
${locator_header}               xpath=//*[@id="__next"]/div[1]/div[1]/div/div[1]/a/h6
${locator_search_filters}       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/div/div[1]
${locator_tab_user}             xpath=//*[@id="__next"]/div[1]/div[1]/div/div[3]/div/ul/li[2]/a/div[2]
${locator_notice_icon}          xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_modal}                xpath=/html/body/div[3]/div[3]/ul
${locator_profile_icon}         xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_select_role}          id=select-role
${locator_admin_option}         id=option-select-role-1
${locator_select_plan}          id=select-plan
${locator_basic_option}         id=option-select-plan-1
${locator_select_status}        id=select-status
${locator_pending_option}       id=option-select-status-1
${locator_clear_btn}            id=btn-clear
${locator_search_btn}           id=btn-search
${locator_add_user_btn}         xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_user_tab}             xpath=//*[@id="__next"]/div[1]/div[1]/div/div[3]/div/ul/li[2]/a/div[2]
${locator_user_list}            xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[1]
${locator_logout}               xpath=/html/body/div[3]/div[3]/ul/li
${locator_rows}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${locator_10}                   xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_25}                   xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_50}                   xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_label}                xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
${locator_footer}               xpath=//*[@id="__next"]/div[1]/div[2]/footer/div
${locator_go_top}               xpath=//*[@id="__next"]/div[2]/button
${locator_next}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]
${locator_back}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]

#Locator register page
${locator_reset}                id=reset
${locator_back_btn}             xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${locator_firstname}            id=firstname    
${locator_lastname}             id=lastname
${locator_email}                id=email
${locator_password_register}    id=password
${locator_mobile}               id=mobile-phone
${locator_gender}               validation-basic-radio
${locator_sql}                  name=courses.SQL
${locator_test_manual}          name=courses.Test Manual
${locator_automate_test}        name=courses.Automate Test
${locator_automate_test2}       name=courses.Automate Test2 
${locator_nationality}          id=nationality
${locator_thai}                 xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_role}                 id=select-role    
${locator_role_admin}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_plan}                 id=select-plan  
${locator_basic}                xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_signup_button}        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button 

#error message locator
${locator_fn_err}             id=error-firstname 
${locator_ln_err}             id=error-lastname
${locator_email_err}          id=error-email
${locator_pw_err}             id=error-password
${locator_mobile_err}         id=error-mobile-phone
${locator_gender_err}         id=validation-basic-gender
${locator_course_err}         id=validation-basic-courses
${locator_nationality_err}    id=validation-basic-nationality
${locator_role_err}           id=validation-role
${locator_plan_err}           id =validation-plan