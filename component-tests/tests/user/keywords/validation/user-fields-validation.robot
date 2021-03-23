*** Settings ***
Library    Collections
Library    OperatingSystem

*** Keywords ***
User response field ${field} should be ${value}
    Should Be Equal As Strings      ${res.json()["${field}"]}      ${value}