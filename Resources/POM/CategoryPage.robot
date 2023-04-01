*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${category_header}  id:heading1
${apple_category}   id:top_menu_link_19884
${sort_by_dropdown}  name:sortGoodsBy
${sort_descending}  2
${sort_descending_label}  Brangiausios viršuje
${add_to_cart_button_container}  class:addToCart-container
${added_to_cart_label_name}  Prekė įdėta į Jūsų krepšelį.

*** Keywords ***
Sort Items
    [Arguments]     ${sorting}
    Wait Until Element Is Visible  ${category_header}
    Click Element  ${sort_by_dropdown}
    Select From List By Index  ${sort_by_dropdown}  ${sorting}
    List Selection Should Be  ${sort_by_dropdown}  ${sort_descending_label}

Add ${items_count} Most Expensive Items to Cart
    Scroll Element Into View  ${add_to_cart_button_container}

    ${index}=  Set Variable  1

    FOR  ${i}  IN  RANGE  ${items_count}
      ${cart_item}=  Set Variable  xpath://div[@class="product-list flex"]//div[${index}]//a[@class="pr zitt vv addCart btn1 a0 fl mr5"]
      ${added_to_cart_label}=   Set Variable  xpath://div[@class="product-list flex"]//div[${index}]//div[contains(@class, "add-to-cart-message success-list")]

      Click Element  ${cart_item}
      Wait Until Element Is Visible  ${added_to_cart_label}
      Element Text Should Be  ${added_to_cart_label}  ${added_to_cart_label_name}
      Log To Console  An item ${index} added to the Cart
      ${index}=  Evaluate  ${index} + 1
    END

Check Cart Icon in Header
    [Arguments]     ${goods_count}
    ${populated_cart}   Set Variable      xpath://div[@id="cart-inner"]//strong[text()="${goods_count}"]
    Execute JavaScript  window.scrollTo(0, 0)
    Wait Until Element Is Visible  ${populated_cart}
    Log To Console  Checking that cart counter is equal to ${goods_count}