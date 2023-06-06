# robot --include iframe -d Report Tests/test.robot
*** Settings ***
Resource    ../Library/resource.robot
Library    pabot.PabotLib
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1
    Open Browser To "https://www.amazon.in"

Test Case 2
    Open Browser To "https://www.topgrep.com"

Test Case 3
    Open Browser To "https://www.wikipedia.org"

Test Case 4
    Open Browser To "https://www.makemytrip.com"
