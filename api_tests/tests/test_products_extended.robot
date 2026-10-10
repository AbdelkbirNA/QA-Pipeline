*** Settings ***
Library     RequestsLibrary
Resource    ../resources/api_keywords.resource

Documentation    Extended coverage for Fake Store products endpoints.


*** Variables ***
${BASE_URL}    https://fakestoreapi.com


*** Test Cases ***
GET produit unique - structure valide
    [Documentation]    Vérifie qu'un produit unique contient les champs essentiels.
    ${response}=    GET    ${BASE_URL}/products/1
    Valider Status Code    ${response}    200
    ${product}=    Set Variable    ${response.json()}
    Valider Produit Unique    ${product}

GET produits limite 5 - volume respecte
    [Documentation]    Vérifie que le paramètre limit retourne le bon nombre d'éléments.
    ${response}=    GET    ${BASE_URL}/products    params=limit=5
    Valider Status Code    ${response}    200
    Valider Limite Resultats    ${response.json()}    5

GET produits et categories - coherence categorie
    [Documentation]    Vérifie qu'une catégorie produit appartient à la liste des catégories.
    ${products_response}=    GET    ${BASE_URL}/products    params=limit=5
    ${categories_response}=    GET    ${BASE_URL}/products/categories
    Valider Status Code    ${products_response}    200
    Valider Status Code    ${categories_response}    200
    ${products}=    Set Variable    ${products_response.json()}
    ${categories}=    Set Variable    ${categories_response.json()}
    Valider Categories    ${categories}
    Valider Categories Produits    ${products}    ${categories}
