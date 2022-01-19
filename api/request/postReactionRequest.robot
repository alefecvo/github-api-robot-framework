*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot

*** Variables ***
${ALIAS}                   github
${URI}                     /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues

*** Keywords ***
Enviar a reação "${REACTION}" para issure "${ISSURE_NUMBER}"
    &{HEADERS}        Create Dictionary      Accept=application/vnd.github.v3+json
    ${RESPONSE}       POST On Session        ${ALIAS}            ${URI}/${ISSURE_NUMBER}/reactions
    ...                                      headers=${HEADERS}
    ...                                      data={"content":"${REACTION}"} 

    Log    Meus dados: ${RESPONSE.json()}
    Set Test Variable    ${RESPONSE}


Conferir resposta status code
    [Arguments]    ${STATUS_CODE_200}    ${STATUS_CODE_201}
    Should Be True   '${RESPONSE.status_code}'=='${STATUS_CODE_200}' or '${RESPONSE.status_code}'=='${STATUS_CODE_201}'