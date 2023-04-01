*** Settings ***
Documentation  E-Shop Homework in Robot Framework
Library  SeleniumLibrary
Resource  ../Resources/POM/HomePage.robot
Resource  ../Resources/POM/CategoryPage.robot
Resource  ../Resources/POM/Common.robot
Resource  ../Resources/POM/CartPage.robot

Test Setup          Start Browser
Test Teardown       Close Browser

*** Variables ***
${number_of_items}  2

*** Test Cases ***
Add Items To Card
    [Documentation]  Add two most expensive items to the shopping cart from the category
    Verify HomePage is Fully Loaded
    Navigate to Category                ${apple_category}
    Sort items                          ${sort_descending}
    Add ${number_of_items} Most Expensive Items to Cart
    Check Cart Icon in Header           ${number_of_items}
    Check Cart Populated with ${number_of_items}