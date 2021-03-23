*** Settings ***
Resource    ../../../helpers/http-helper.robot
Resource    ../keywords/validation/user-fields-validation.robot
Library     Collections
Library     OperatingSystem

*** Variables ***
${base_url}=    http://localhost:9080

*** Test Cases ***
Get user by id with success
    Given Valid id 1
    When Request the endpoint /user passing given id
    Then Should return response status 200
    And User response field id should be 1
    And User response field name should be User1
    And User response field email should be user1@email.com

Get user by id with success
    Given Valid id 2
    When Request the endpoint /user passing given id
    Then Should return response status 200
    And User response field id should be 2
    And User response field name should be User2
    And User response field email should be user2@email.com

Get user by id with success
    Given Valid id 3
    When Request the endpoint /user passing given id
    Then Should return response status 200
    And User response field id should be 3
    And User response field name should be User3
    And User response field email should be user3@email.com


*** Keywords ***
Given Valid id ${id}
    Set Test Variable    ${id}

When Request the endpoint ${endpoint} passing given id
    Log                  Endpoint: ${endpoint}
    &{headers}=          Create Dictionary      Content-Type           application/json
    ${res}=              GET                    ${base_url}            ${endpoint}/${id}             ""           ${headers}
    Log                  Response body: ${res.json()} \nStatus: ${res.status_code}
    Set Test Variable    ${res}

Then Should return response status ${status}
    Should Be Equal As Strings     ${res.status_code}      ${status}

