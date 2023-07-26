*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/String.py
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/XML.py

*** Variables ***
${base_url}    https://gorest.co.in/public/v2/users
${email_regex}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
${auth_token}    Bearer f3bc5812a86d71f781c1acc82ae31eaa446709f2f9a14c7ca49f3fbc15abf6dc    

*** Test Cases ***
Get Request Test
    [Tags]    Get
    ${hearders}=    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}
    Set Global Variable    ${hearders}
    ${response}=    Get    ${base_url}    expected_status=200    headers=${hearders}
    Log    ${response}
    Log    ${response.json()}
    Log To Console    ${response.json()}
#    Should Be Equal As Numbers    2708985    ${response.json()}[0][id]
#    Should Be Equal As Strings    Anil Tagore    ${response.json()}[0][name]
# #    Should Be Equal As Strings    Bharat Tandon    ${response.json()}[9][name]
# #    Run Keyword And Continue On Failure    Should Contain    ${response.json()}[9][name]    Bhaat Tandon
#    Should Start With    ${response.json()}[0][name]    An
#    Should End With    ${response.json()}[0][name]    gore
#    Should Be Lower Case    ${response.json()}[0][email]
#    Should Match Regexp    ${response.json()}[0][email]    ${email_regex}
#    Dictionary Should Contain Key    ${response.json()}[0]    name
#    ${f_name}=    Get From Dictionary    ${response.json()}[0]    name
#    Log To Console    ${f_name}
#    Log    ${f_name}

Post Request Test
    [Tags]    Post
    ${hearders}=    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}
    ${req_body}=    Create Dictionary    name=Rajesh4    email=rr3@dummy.com    gender=male    status=active
    ${response}=    Post    ${base_url}    json=${req_body}    expected_status=201    headers=${hearders}
    ${id}=    Get From Dictionary    ${response.json()}    id
    Set Global Variable    ${id}
    Should Be Equal As Strings    ${response.json()}[name]    Rajesh4
    Log    ${response.json()}
    Log To Console    ${response.json()}

Patch Request Test
    [Tags]    Patch
    ${req_body}=    Create Dictionary    name=Rajesh4    email=rr2@dummy.com    status=active
    ${response}=    Patch    ${base_url}/${id}    json=${req_body}    expected_status=200    headers=${hearders}
    Log To Console   ${response.json()}
    Log    ${response.json()}
    Should Be Equal As Strings    Rajesh4    ${response.json()}[name]

Delete Request Test
    [Tags]    Delete
    ${response}=    Delete    ${base_url}/${id}    expected_status=204    headers=${hearders}
    Log To Console    ${response}
    Log    ${response}
