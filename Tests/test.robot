# robot --include iframe -d Report Tests/test.robot
# pabot --processes 4 Tests
# pabot --processes 4 --testlevelsplit Tests/patest.robot
# pabot --processes 4 --testlevelsplit Tests
*** Settings ***
Resource    ../Library/resource.robot
Library    pabot.PabotLib
Test Teardown    Close Browser

*** Test Cases ***
Test Run 1
    Open Browser To "https://artoftesting.com/samplesiteforselenium"
    Type "TopGrep" then click Submit

Failed Test Run
    [Tags]    sanity failedtest
    Open Browser To "https://chromedriver.chromium.org/"

Test Run 2
    [Tags]    sanity    test2
    Open Browser To "https://saucedemo.com"
    Read CSV Data

Sauce demo
    [tags]    saucedemo
    Given A User Is logged In To The Website

User Buys Backpack From Sauce Demo
    [Tags]    saucedemo    backpack
    Given Sauce Demo Is Up And Running
    And A User Is Logged In
    And A User Wants To Buy "Bolt"
    When They Add The Product To Cart
    Then The Product Is Shown In The Cart
    When User Completes The Checkout
    Then Confirmation Should Be Displayed

Handeling Iframes
    [Tags]    iframe
    
    Open Browser To "https://www.w3schools.com/html/html_iframe.asp"
    Select Frame    //iframe[contains(@src, "default")]
    Click Element    //a[contains(text(),'JAVASCRIPT')]
    Unselect Frame
    Click Element    //a[contains(text(),'PYTHON')]