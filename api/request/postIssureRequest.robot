*** Settings ***
Library                    RequestsLibrary
Library                    String
Resource                   ../../api/base/base.robot

*** Variables ***
${ALIAS}                   github
${URI}                     /repos/mayribeirofernandes/myudemyrobotframeworkcourse
${USER}                    alefecvo

*** Keywords ***
Criar uma issure com label "${LABEL}"
    &{HEADERS}        Create Dictionary      Accept=application/vnd.github.v3+json
    ${DATA}           Format String    ${EXECDIR}/api/data/input/postIssure.json
    ...               user_git=${USER}
    ...               label=${LABEL}
    Log    Meu log ficou \n${DATA}
    
    ${RESPONSE}       POST On Session        ${ALIAS}            ${URI}/issues
    ...                                      headers=${HEADERS}
    ...                                      data=${DATA}

    # Log    Meus dados: ${RESPONSE.json()}
    Set Test Variable    ${RESPONSE}


Conferir resposta status code
    [Arguments]    ${STATUS_CODE_200}    ${STATUS_CODE_201}
    Should Be True   '${RESPONSE.status_code}'=='${STATUS_CODE_200}' or '${RESPONSE.status_code}'=='${STATUS_CODE_201}'