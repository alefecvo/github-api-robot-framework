*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/getUserRequest.robot

Suite Setup                Create session github autenticated

*** Test Cases ***
Deve retornar dados do usuário no github
    Fazer requisição em dados do usuário
    Conferir resposta status code    200

