*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${category_id}  id:top_menu_link_19884
${cookies_button}  xpath://*[@id="template_body_col_2_left"]/div[1]/div/a

*** Keywords ***
Verify HomePage is Fully Loaded
    Element Should Be Visible  ${cookies_button}  timeout=5
    Click Element  ${cookies_button}

Navigate to Category
    [Arguments]     ${category_id}
    Click Element   ${category_id}