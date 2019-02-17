coding: utf-8
*** Settings ***
Documentation  Etsi tietojenkäsittelyn koulutus XAMK:in verkkosivuilta
Library       SeleniumLibrary
Resource      ../common-resource.robot
Resource      ../keywords/toiminnot.robot
*** Variables ***

*** Keywords ***

*** Test Cases ***
Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma
    [Tags]    jenkins   local   demo    old
    Avaa selain XAMKin etusivulle
    Tarkista että etusivu on auki
    Siirry koulutus välilehdelle
    Run Keyword If    '${CONFIGURATION}' == 'jenkins'    Sulje sharepalkki
    Siirry AMK-tutkinnot välilehdelle
    Hae tietojenkäsittelyn koulutusta
    Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Siirry tietojenkäsittelyn koulutuksen sivulle
    [Teardown]    Sulje selain

Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma suoraan hakukentästä
    [Tags]    jenkins   local   demo    working
    Avaa selain XAMKin etusivulle
    Tarkista että etusivu on auki
    Etsi etusivun hakukentästä tietojenkäsittely
    Tarkista että tietojenkäsittelyn opinnoista kertova sivu on auki
    [Teardown]    Sulje selain
