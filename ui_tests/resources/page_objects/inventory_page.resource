*** Settings ***
Library    Browser

Documentation    Shared keywords for the SauceDemo inventory page.


*** Variables ***
${PRODUCT_TITLE}     css=.inventory_item_name >> nth=0
${PRODUCT_PRICE}     css=.inventory_item_price >> nth=0
${CART_ICON}         css=#shopping_cart_container


*** Keywords ***
Verifier Produits Affiches
    [Documentation]    Vérifie que les produits sont visibles sur la page inventaire.
    Wait For Elements State    ${PRODUCT_TITLE}    visible

Verifier Prix Produits
    [Documentation]    Vérifie que les prix des produits sont visibles sur la page inventaire.
    Wait For Elements State    ${PRODUCT_PRICE}    visible

Ajouter Premier Produit Au Panier
    [Documentation]    Ajoute le premier produit au panier.
    Click    css=#add-to-cart-sauce-labs-backpack

Aller Au Panier
    [Documentation]    Ouvre le panier.
    Click    ${CART_ICON}

Verifier Produit Dans Panier
    [Documentation]    Vérifie qu'un produit est présent dans le panier.
    Wait For Elements State    css=.cart_item    visible
