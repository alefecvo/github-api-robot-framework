*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     JSONLibrary

*** Variables ***
${MEU_DICT_ESPERADO}    {"primeiro_nome": "mayara", "nomes_do_meio": "ribeiro", "ultimo_nome": "fernandes", "apelido": "May"}


*** Keywords ***
Pega JSON
    ${MEU_JSON_COMPLEXO}     Get File    ${EXECDIR}/api/data/output/json_complexo.json
    ### A Get File retorna ums STRING, vamos transformá-la em JSON
    ${MEU_JSON_COMPLEXO}                Convert String to JSON        ${MEU_JSON_COMPLEXO}
    #Log To Console    ${MEU_JSON_COMPLEXO}
    [Return]        ${MEU_JSON_COMPLEXO}

Confere objetos e sub-objetos do JSON
    ${MEU_JSON_COMPLEXO}     Pega JSON
    ${MEU_DICT_ESPERADO}     Convert String to JSON     ${MEU_DICT_ESPERADO}

    #Log To Console    ${MEU_DICT_ESPERADO}

    ### Conferindo um sub-dicionário dentro de um JSON
    Dictionary Should Contain Sub Dictionary    ${MEU_JSON_COMPLEXO["pessoa"]["nome"]}
    ...         ${MEU_DICT_ESPERADO}

    ### Conferindo campo a campo
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["nome"]}    apelido    May

    # Log To Console    ${MEU_JSON_COMPLEXO["pessoa"]["nome"]} 

    ### Chegando em um valor dentro de uma lista de dicionários
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][0]}    titulo    O Símbolo Perdido
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][1]}    titulo    Sócios no Crime
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][2]}    titulo    Fortaleza Digital

    # Log To Console    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][0]}

Confere listas no JSON
    ${MEU_JSON_COMPLEXO}     Pega JSON

    ### Conferindo valor contido em uma lista
    List Should Contain Value    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["PC"]}    Aika

    ### Pegando o valor de uma determinada posição da lista
    ${GAME}     Get From List    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["Xbox"]}    2
    Log         Game da posição 2 da lista: ${GAME}

    ### Conferindo se não há duplicidade de itens da lista
    List Should Not Contain Duplicates    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["Xbox"]}

    ### Percorrendo uma lista
    @{LISTA_DE_LIVROS}   Get From Dictionary   ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]}   livros
    FOR  ${LIVRO}   IN   @{LISTA_DE_LIVROS}
        Log   Título: ${LIVRO["titulo"]}\nAutor: ${LIVRO["autor"]}
    END
