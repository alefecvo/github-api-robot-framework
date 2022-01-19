*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/postReactionRequest.robot

Suite Setup                Create session github autenticated

*** Test Cases ***
Deve criar uma reação na issure 01
    [Tags]    reactions
    Enviar a reação "eyes" para issure "8"
    Conferir resposta status code    200    201

