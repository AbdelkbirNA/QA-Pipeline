*** Settings ***
Resource    ../resources/page_objects/login_page.resource
Resource    ../resources/page_objects/inventory_page.resource
Resource    ../resources/page_objects/cart_page.resource
Resource    ../resources/page_objects/checkout_page.resource

Documentation    End-to-end purchase flow for SauceDemo.


*** Test Cases ***
Achat Complet Produit
    [Documentation]    Vérifie le parcours d'achat complet sur SauceDemo.
    Ouvrir Page Login
    Se Connecter Avec Credentials    standard_user    secret_sauce

    Ajouter Premier Produit Au Panier
    Aller Au Panier

    Aller Au Checkout
    Remplir Informations Client    John    Doe    12345
    Continuer Vers Recapitulatif
    Confirmer Achat

    Get Text    css=[data-test="complete-header"]    contains    Thank you for your order
