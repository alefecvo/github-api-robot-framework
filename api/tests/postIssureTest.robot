*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/postIssureRequest.robot

Suite Setup                Create session github autenticated

*** Test Cases ***
Deve criar uma issure bug
    [Tags]    issure
    Criar uma issure com label "robot framework"
    Conferir resposta status code    200    201

