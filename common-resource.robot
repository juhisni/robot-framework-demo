coding: utf-8
*** Settings ***
Documentation  A resource file with reusable keywords and variables. Utilizes
...            keywords by the imported SeleniumLibrary.
Library       SeleniumLibrary
*** Variables ***
${BROWSER}      Chrome
${DELAY}        0.2
${URL_XAMK}     https://www.xamk.fi/
${TIMEOUT_GLOBAL}   10s

*** Keywords ***
Sulje selain
    Close Browser
