*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CategoryHeader}  id:heading1
${SortByDropdown}  name:sortGoodsBy
${SortDescendind}  name:sortGoodsBy
${AddToCartButtonContainer}  class:addToCart-container
${AddToCartButton}  xpath://a[@class="pr zitt vv addCart btn1 a0 fl mr5"]
${SuccessLabel}  xpath://div[@class="addToCart-container"]/div
${PopulatedCart}  xpath://div[@id="cart-inner"]//strong[text()="2"]

*** Keywords ***
Sort by the Most Expensive Items
    Wait Until Element Is Visible  ${CategoryHeader}
    Click Element  ${SortByDropdown}
    Select From List By Index  ${SortDescendind}  2
    List Selection Should Be  ${SortDescendind}  Brangiausios viršuje

Add Two Most Expensive Items to the Cart
    Scroll Element Into View  ${AddToCartButtonContainer}
    @{all_cart_buttons}   Get WebElements     class:pr zitt vv addCart btn1 a0 fl mr5
    FOR  ${cartbutton}  IN  @{all_cart_buttons}[0:1]
      Wait Until Page Contains Element  ${AddToCartButton}
      Click Element  ${cartbutton}
      Wait Until Element Is Visible  ${SuccessLabel}
      Element Text Should Be  ${SuccessLabel}  Prekė įdėta į Jūsų krepšelį.
      Log To Console  An item has been added to the Cart    
    END

Check The Cart Icon in the Header
    Execute JavaScript  window.scrollTo(0, 0)
    Wait Until Element Is Visible  ${PopulatedCart}
    Log To Console  Checking that cart counter is equal to 2