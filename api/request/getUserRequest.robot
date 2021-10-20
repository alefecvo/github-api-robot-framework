*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot

*** Variables ***
${ALIAS}                   github
${URI}                     /user

*** Keywords ***
Fazer requisição em dados do usuário
    ${RESPONSE}    GET On Session     ${ALIAS}     ${URI}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Conferir resposta status code
    [Arguments]    ${STATUS_CODE}
    Should Be Equal As Strings    ${RESPONSE.status_code}     ${STATUS_CODE}
         