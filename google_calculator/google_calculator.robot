*** Settings ***
Library                SeleniumLibrary
Suite Setup            Set Selenium Speed        0.25s
Test Setup             Open Google 
Test Teardown          Close Browser
Suite Teardown         Close All Browsers


*** Variables ***
${url}                                 https://www.google.com/
${browser}                             chrome
${keyword}                             Google Calculator
${locator_search_field}                name=q
${locator_calculator}                  xpath=//*[@id="rso"]/div[1]/div/div/div
${locator_num6}                        xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[3]/div/div
${locator_num3}                        xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[3]/div/div
${locator_add}                         xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div
${locator_substract}                   xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div
${locator_multiply}                    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div
${locator_divide}                      xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[2]/td[4]/div/div
${locator_equal}                       xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div
${locator_clear}                       xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[1]/td[4]/div/div[1]
${locator_answer}                      id=cwos

*** Keywords ***
#สร้าง Keyowrd เพื่อเปิด browser และค้นหา calculator
Open Google 
    #ใช้คำสั่ง Open Browser โดยระบุ url กับ browser เพื่อเปิดเว็บ google
    Open Browser                       ${url}            ${browser}
    #ขยาย browser ให้เต็มจอ
    Maximize Browser Window

Search calculator
    #รอจนกว่า element search field จะแสดง โดยใส่ locator ไว้ในตัวแปร ${locator_search_field}
    Wait Until Element Is Visible      ${locator_search_field}
    #เมื่อ element search field แสดงแล้วให้ใส่คำที่ต้องการค้นหาคือ Google Calculator โดยใส่ไว้ในตัวแปร ${keyword} 
    Input Text                         ${locator_search_field}            ${keyword}
    #ทำการกดปุ่ม Enter เพื่อแสดงผลการค้นหา
    Press Keys                         ${locator_search_field}            ENTER
    #ตรวจสอบหน้า calculator โดยรอจนกว่า element ของ calculator แสดง
    Wait Until Page Contains Element   ${locator_calculator} 
    
Verify calculator answer - Addition
    #ทำการกดเลข 6 
    Click Element                      ${locator_num6}
    #กดเครื่องหมายบวก
    Click Element                      ${locator_add}
    #กดเลข 3 
    Click Element                      ${locator_num3}
    #กดเครื่องหมาย = เพื่อแสดงคำตอบ
    Click Element                      ${locator_equal}
    #ตรวจสอบคำตอบโดยใช้คำสั่ง verify answer ในรูปแบบ argument ระบุ locator และคำตอบ
    Verify answer                      ${locator_answer}            9

Verify calculator answer - Substract
    #ทำการกดเลข 6 
    Click Element                      ${locator_num6}
    #กดเครื่องหมายลบ
    Click Element                      ${locator_substract}
    #กดเลข 3 
    Click Element                      ${locator_num3}
    #กดเครื่องหมาย = เพื่อแสดงคำตอบ
    Click Element                      ${locator_equal}
    #ตรวจสอบคำตอบโดยใช้คำสั่ง verify answer ในรูปแบบ argument ระบุ locator และคำตอบ
    Verify answer                      ${locator_answer}            3

Verify calculator answer - Multiply
    #ทำการกดเลข 6  
    Click Element                      ${locator_num6}
    #กดเครื่องหมายคูณ
    Click Element                      ${locator_multiply}
    #กดเลข 3 
    Click Element                      ${locator_num3}
    #กดเครื่องหมาย = เพื่อแสดงคำตอบ
    Click Element                      ${locator_equal}
    #ตรวจสอบคำตอบโดยใช้คำสั่ง verify answer ในรูปแบบ argument ระบุ locator และคำตอบ
    Verify answer                      ${locator_answer}            18

Verify calculator answer - Divide
    #ทำการกดเลข 6 
    Click Element                      ${locator_num6}
    #กดเครื่องหมายหาร
    Click Element                      ${locator_divide}
    #กดเลข 3 
    Click Element                      ${locator_num3}
    #กดเครื่องหมาย = เพื่อแสดงคำตอบ
    Click Element                      ${locator_equal}
    #ตรวจสอบคำตอบโดยใช้คำสั่ง verify answer ในรูปแบบ argument ระบุ locator และคำตอบ
    Verify answer                      ${locator_answer}            2

Verify answer
    #ตรวจสอบคำตอบโดยสร้าง keyword ในรูปแบบ argment มี 2 arguments คือ locator และ answer ระบุคำตอบ
    [Arguments]                        ${locator}            ${answer}
    #รับค่าคำตอบจาก locator 
    ${result}=    Get Text             ${locator}
    #ตรวจสอบคำตอบที่ได้จาก locator ว่าตรงกับคำตอบที่คาดหวังหรือไม่ โดยเทียบค่าที่ได้ใน result กับคำตอบที่กำหนดไว้
    Should Be Equal As Strings         ${result}             ${answer}

*** Test Cases ***
TC-01 Verify Google Calculator
    [Documentation]    ตรวจสอบหน้า Google Calculator
    [Tags]    Calculator
    #ใช้ keyword search calculator เพื่อค้นหา Google Calculator
    Search calculator

TC-02 Addition case
    [Documentation]    ทดสอบกรณีการบวก
    [Tags]    Operator +
    #ใช้ keyword search calculator เพื่อค้นหา Google Calculator
    Search calculator
    #ใช้ keyword Verify calculator answer - Addition เพื่อทดสอบกรณี case กดเครื่องหมายบวก
    Verify calculator answer - Addition

TC-03 Substract case
    [Documentation]    ทดสอบกรณีการลบ
    [Tags]    Operator -
    #ใช้ keyword search calculator เพื่อค้นหา Google Calculator
    Search calculator
    #ใช้ keyword Verify calculator answer - Substract เพื่อทดสอบกรณี case กดเครื่องหมายลบ
    Verify calculator answer - Substract

TC-04 Multiply case
    [Documentation]    ทดสอบกรณีการคูณ
    [Tags]    Operator *
    #ใช้ keyword search calculator เพื่อค้นหา Google Calculator
    Search calculator
    #ใช้ keyword Verify calculator answer - Multiply เพื่อทดสอบกรณี case กดเครื่องหมายคูณ
    Verify calculator answer - Multiply

TC-05 Divide case
    [Documentation]    ทดสอบกรณีการหาร
    [Tags]    Operator /
    #ใช้ keyword search calculator เพื่อค้นหา Google Calculator
    Search calculator
    #ใช้ keyword Verify calculator answer - Divide เพื่อทดสอบกรณี case กดเครื่องหมายหาร
    Verify calculator answer - Divide
    




