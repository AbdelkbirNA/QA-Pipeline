*** Settings ***
Library    Browser

Documentation    Shared keywords for the SauceDemo checkout page.


*** Variables ***
${FIRST_NAME}    css=#first-name
${LAST_NAME}     css=#last-name
${POSTAL_CODE}   css=#postal-code
${CONTINUE}      css=#continue
${FINISH}        css=#finish


*** Keywords ***
Remplir Informations Client
    [Documentation]    Remplit les informations client du checkout.
    [Arguments]    ${first}    ${last}    ${zip}
    Fill Text    ${FIRST_NAME}    ${first}
    Fill Text    ${LAST_NAME}     ${last}
    Fill Text    ${POSTAL_CODE}   ${zip}

Continuer Vers Recapitulatif
    [Documentation]    Valide les informations client et ouvre le récapitulatif de commande.
    Click    ${CONTINUE}

Confirmer Achat
    [Documentation]    Confirme la commande en cours.
    Click    ${FINISH}
