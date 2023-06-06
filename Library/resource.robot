*** Settings ***
Library    SeleniumLibrary
Library    demo_keyword.py
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/Telnet.py
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/String.py
Variables    ../Constants/Xpaths/art_of_testing.py
Variables    ../Constants/Xpaths/saucedemo.py

*** Variables ***
${WEBSITE_URL}    https://artoftesting.com/samplesiteforselenium
${BROWSER}    Chrome
${EXEC_PATH}    /Users/chiranth.c/Documents/robot_framework/Constants/Driver/chromedriver.exe

*** Keywords ***
Open Browser To "${URL}"
    Open Browser     ${URL}    ${BROWSER}    executable_path=${EXEC_PATH}
    Maximize Browser Window
    Set Selenium Speed    1
#    Page Should Contain Element    ${lnk_link_text}  

Type "${text}" then click Submit
    Page Should Contain Element    ${tbx_text_box}
    Input Text    ${tbx_text_box}    ${text}
    Page Should Contain Button    ${btn_submit}
    Click Element    ${btn_submit}

Read CSV Data 
    ${csv_data}=    Read Csv    Data/demo.csv
    Log To Console    CSV Data ${csv_data}


Given A User Is logged In To The Website
    Open Browser To "https://saucedemo.com"
    Page Should Contain Element    ${txt_box_usrname}
    Input Text    ${txt_box_usrname}    standard_user
    Input Text    ${txt_box_password}    secret_sauce
    Click Element    ${btn_login}

Sauce Demo Is Up And Running
    Open Browser To "https://saucedemo.com"
    Page Should Contain Element    ${txt_box_usrname}

A User Is Logged In
    Input Text    ${txt_box_usrname}    standard_user
    Input Text    ${txt_box_password}    secret_sauce
    Click Element    ${btn_login}
    Page Should Contain Element    ${txt_products}
#A User Wants To Buy "product"
#    Page Should Contain Element    ${lnk_backpack}
3   Click Element    ${lnk_backpack}


A User Wants To Buy ${product_name}
    ${product_xpath}=    Replace String    ${lnk_backpack}    <product_name>    ${product_name}
    Page Should Contain Element    ${product_xpath}
    Click Element    ${product_xpath}


They Add The Product To Cart
    Page Should Contain Element    ${btn_add_cart}
    Click Element    ${btn_add_cart}
The Product Is Shown In The Cart
    Page Should Contain Element    ${btn_remove}
    Page Should Contain Element    ${shopping_cart_btn}
    Click Element    ${shopping_cart_btn}
    Wait Until Element Is Visible    ${btn_checkout}


User Completes The Checkout
    Click Element     ${btn_checkout}
    Wait Until Element Is Visible  ${txt_box_firstname}
    Input Text    ${txt_box_firstname}    Test
    Input Text    ${txt_box_lastname}    User
    Input Text    ${txt_box_zipcode}    12345
    Click Element    ${btn_continue}
    Page Should Contain Element    ${txt_payment_info}
    Page Should Contain Element    ${txt_shipping_info}
    Page Should Contain Element    ${btn_finish}
    Click Element    ${btn_finish}

    

Confirmation Should Be Displayed
    Page Should Contain Element    ${txt_thank_you}
    Page Should Contain Element    ${btn_back_home}