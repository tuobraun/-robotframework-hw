*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${cart_icon}  id:cart-link
${cart_title}  KREPŠELIS
${items_container}  xpath://table[@class="fr price-info mt20"]

*** Keywords ***
Check Cart Populated with ${items_count}
    Click Element   ${cart_icon}
    Wait Until Element Is Visible       tag:h1  timeout=5
    Element Text Should Be              tag:h1  ${cart_title}
    Element Text Should Be              ${items_container}  Viso kiekis: ${items_count}
    Log To Console                      Checking that cart contains ${items_count} items