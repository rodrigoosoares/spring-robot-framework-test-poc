*** Settings ***
Library    RequestsLibrary

*** Keywords ***
GET
    [arguments]               ${apiBaseUrl}                   ${apiServiceUrl}    ${params}          ${headers}
    Create Session            httpSession                     ${apiBaseUrl}       verify=True
    ${resp}=                  Get Request                     httpSession         ${apiServiceUrl}    params=${params}    headers=${headers}
    [Return]                  ${resp}