*** Settings ***
Documentation       Browser start options
Library             SeleniumLibrary

*** Variables ***
${SITE_URL}           https://www.case4you.lt
${DEFAULT_BROWSER}    Edge

*** Keywords ***
Start Browser
    [Arguments]         ${browser_type}=${DEFAULT_BROWSER}
    Open Browser        ${site_url}         ${browser_type}
    Maximize Browser Window