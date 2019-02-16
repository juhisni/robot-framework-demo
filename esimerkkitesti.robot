coding: utf-8
*** Settings ***
Documentation  A resource file with reusable keywords and variables. Utilizes
...            keywords by the imported SeleniumLibrary.
Library       SeleniumLibrary
Library       DateTime
*** Variables ***
${DELAY}        0.2

*** Keywords ***
Sulje selain
    Close Browser

*** Test Cases ***
Avaa selain iltasanomiin
    Open Browser  https://iltasanomat.fi  Chrome
    Page Should Contain  iltasanomat
    Sulje selain
