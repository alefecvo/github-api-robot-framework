*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/postIssureCommentsRequest.robot

Suite Setup                Create session github autenticated

*** Test Cases ***
Deve criar um comentário na issues 12
    [Tags]    comments
    Create session github autenticated
    Fazer requisição para criar comentário na issues    12
    Conferir resposta status code    200    201

Deve consultar comentários das issues ordenados por update e desc
    [Tags]    comments
    Create session github not autenticated
    Fazer requisição para para consultar comentários das issues    update    desc
    Conferir resposta status code    200    201

