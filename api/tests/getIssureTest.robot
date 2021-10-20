*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/getIssureRequest.robot

Suite Setup                Create session github not autenticated

*** Test Cases ***
Deve retornar dados de issure
    Fazer requisição nas issures    open    bug
    Conferir resposta status code    200

