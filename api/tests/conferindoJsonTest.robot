*** Settings ***
Library                    RequestsLibrary
Resource                   ../../api/base/base.robot
Resource                   ../../api/request/conferindoJsonRequest.robot


*** Test Cases ***
Exemplo: Conferindo JSON complexo
    Confere objetos e sub-objetos do JSON
    Confere listas no JSON

