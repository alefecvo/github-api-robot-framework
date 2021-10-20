*** Settings ***

Documentation              Github:https://docs.github.com/en/rest/reference/users#get-the-autenticated-user
Library                    RequestsLibrary
Resource                   ../../api/data/token.robot

*** Variables ***
${BASE_URL}                https://api.github.com
${ALIAS}                   github


*** Keywords ***
Create session github autenticated
    ${HEADERS}        Create Dictionary        Authorization=Bearer ${TOKEN}
    Create Session                    ${ALIAS}     ${BASE_URL}    ${HEADERS}

Create session github not autenticated
    Create Session                    ${ALIAS}     ${BASE_URL}   