*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot

*** Variables ***
${ALIAS}                   github
${URI}                     /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues

*** Keywords ***
Fazer requisição nas issures
    [Arguments]    ${STATE}    ${LABELS}
    &{PARAMS}      Create Dictionary    state=${STATE}    labels=${LABELS}
    ${RESPONSE}    GET On Session     ${ALIAS}     ${URI}    params=${PARAMS}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Conferir resposta status code
    [Arguments]    ${STATUS_CODE}
    Should Be Equal As Strings    ${RESPONSE.status_code}     ${STATUS_CODE}
         