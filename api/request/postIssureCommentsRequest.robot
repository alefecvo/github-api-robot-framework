*** Settings ***
Library                    RequestsLibrary
Library                    String
Resource                   ../../api/base/base.robot

*** Variables ***
${ALIAS}                   github
${URI}                     /repos/mayribeirofernandes/myudemyrobotframeworkcourse

*** Keywords ***
Fazer requisição para criar comentário na issues
    [Arguments]    ${ISSURE_NUMBER}
    &{HEADERS}        Create Dictionary      Accept=application/vnd.github.v3+json
    
    ${RESPONSE}       Post Request           ${ALIAS}            ${URI}/issues/${ISSURE_NUMBER}/comments
    ...                                      headers=${HEADERS}
    ...                                      data={"body": "Comentário cadastrado via Robot Framework!"}

    # Log    Meus dados: ${RESPONSE.json()}
    Set Test Variable    ${RESPONSE}


Conferir resposta status code
    [Arguments]    ${STATUS_CODE_200}    ${STATUS_CODE_201}
    Should Be True   '${RESPONSE.status_code}'=='${STATUS_CODE_200}' or '${RESPONSE.status_code}'=='${STATUS_CODE_201}'



Fazer requisição para para consultar comentários das issues
    [Arguments]    ${SORT}    ${DIRECTION}
    &{PARAMS}        Create Dictionary      Sort=${SORT}    Direction=${DIRECTION}
    
    ${RESPONSE}       GET On Session           ${ALIAS}            ${URI}/issues
    ...                                      params=${PARAMS}

    # Log    Meus dados: ${RESPONSE.json()}
    Set Test Variable    ${RESPONSE}     