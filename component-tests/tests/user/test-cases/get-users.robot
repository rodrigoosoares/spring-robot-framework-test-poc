*** Settings ***
Resource    ../../../helpers/http-helper.robot
Library     Collections
Library     OperatingSystem


*** Variables ***
${base_url}=    http://localhost:9080


*** Test Cases ***
Get users names with success
    When Request Users endpoint
    Then Should return status 200
    And Response should be User1


*** Keywords ***
When Request Users endpoint
    &{headers}=          Create Dictionary      Content-Type           application/json
    ${res}=              GET                    ${base_url}            /user                name=User1          ${headers}
    Set Test Variable    ${res}


Should return status ${status}
    Should Be Equal As Strings      ${res.status_code}         ${status}


Response should be ${userName}
    Log                             ${res.text}
    Should Be Equal As Strings      ${res.text}         ${userName}