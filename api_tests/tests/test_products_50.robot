*** Settings ***
Library     RequestsLibrary
Resource    ../resources/api_keywords.resource

Documentation    Suite with 50 API tests for products endpoint coverage.


*** Variables ***
${BASE_URL}    https://fakestoreapi.com


*** Test Cases ***
GET produit 01 - id coherent
    [Template]    Valider Produit Par Id
    1

GET produit 02 - id coherent
    [Template]    Valider Produit Par Id
    2

GET produit 03 - id coherent
    [Template]    Valider Produit Par Id
    3

GET produit 04 - id coherent
    [Template]    Valider Produit Par Id
    4

GET produit 05 - id coherent
    [Template]    Valider Produit Par Id
    5

GET produit 06 - id coherent
    [Template]    Valider Produit Par Id
    6

GET produit 07 - id coherent
    [Template]    Valider Produit Par Id
    7

GET produit 08 - id coherent
    [Template]    Valider Produit Par Id
    8

GET produit 09 - id coherent
    [Template]    Valider Produit Par Id
    9

GET produit 10 - id coherent
    [Template]    Valider Produit Par Id
    10

GET produit 11 - id coherent
    [Template]    Valider Produit Par Id
    11

GET produit 12 - id coherent
    [Template]    Valider Produit Par Id
    12

GET produit 13 - id coherent
    [Template]    Valider Produit Par Id
    13

GET produit 14 - id coherent
    [Template]    Valider Produit Par Id
    14

GET produit 15 - id coherent
    [Template]    Valider Produit Par Id
    15

GET produit 16 - id coherent
    [Template]    Valider Produit Par Id
    16

GET produit 17 - id coherent
    [Template]    Valider Produit Par Id
    17

GET produit 18 - id coherent
    [Template]    Valider Produit Par Id
    18

GET produit 19 - id coherent
    [Template]    Valider Produit Par Id
    19

GET produit 20 - id coherent
    [Template]    Valider Produit Par Id
    20

GET produits limit 01 - taille exacte
    [Template]    Valider Limite Produits
    1

GET produits limit 02 - taille exacte
    [Template]    Valider Limite Produits
    2

GET produits limit 03 - taille exacte
    [Template]    Valider Limite Produits
    3

GET produits limit 04 - taille exacte
    [Template]    Valider Limite Produits
    4

GET produits limit 05 - taille exacte
    [Template]    Valider Limite Produits
    5

GET produits limit 06 - taille exacte
    [Template]    Valider Limite Produits
    6

GET produits limit 07 - taille exacte
    [Template]    Valider Limite Produits
    7

GET produits limit 08 - taille exacte
    [Template]    Valider Limite Produits
    8

GET produits limit 09 - taille exacte
    [Template]    Valider Limite Produits
    9

GET produits limit 10 - taille exacte
    [Template]    Valider Limite Produits
    10

GET produits limit 11 - taille exacte
    [Template]    Valider Limite Produits
    11

GET produits limit 12 - taille exacte
    [Template]    Valider Limite Produits
    12

GET produits limit 13 - taille exacte
    [Template]    Valider Limite Produits
    13

GET produits limit 14 - taille exacte
    [Template]    Valider Limite Produits
    14

GET produits limit 15 - taille exacte
    [Template]    Valider Limite Produits
    15

GET produits limit 16 - taille exacte
    [Template]    Valider Limite Produits
    16

GET produits limit 17 - taille exacte
    [Template]    Valider Limite Produits
    17

GET produits limit 18 - taille exacte
    [Template]    Valider Limite Produits
    18

GET produits limit 19 - taille exacte
    [Template]    Valider Limite Produits
    19

GET produits limit 20 - taille exacte
    [Template]    Valider Limite Produits
    20

GET produits limit 01 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    1

GET produits limit 02 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    2

GET produits limit 03 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    3

GET produits limit 04 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    4

GET produits limit 05 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    5

GET produits limit 06 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    6

GET produits limit 07 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    7

GET produits limit 08 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    8

GET produits limit 09 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    9

GET produits limit 10 - structure premier produit
    [Template]    Valider Structure Premier Produit Avec Limite
    10


*** Keywords ***
Valider Produit Par Id
    [Arguments]    ${product_id}
    ${response}=    GET    ${BASE_URL}/products/${product_id}
    Valider Status Code    ${response}    200
    ${product}=    Set Variable    ${response.json()}
    Valider Produit Unique    ${product}
    ${actual_id}=    Get From Dictionary    ${product}    id
    Should Be Equal As Integers    ${actual_id}    ${product_id}

Valider Limite Produits
    [Arguments]    ${limit}
    ${response}=    GET    ${BASE_URL}/products    params=limit=${limit}
    Valider Status Code    ${response}    200
    Valider Limite Resultats    ${response.json()}    ${limit}

Valider Structure Premier Produit Avec Limite
    [Arguments]    ${limit}
    ${response}=    GET    ${BASE_URL}/products    params=limit=${limit}
    Valider Status Code    ${response}    200
    ${products}=    Set Variable    ${response.json()}
    Valider Liste Produits    ${products}
    Valider Premier Produit    ${products}
