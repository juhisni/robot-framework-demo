coding: utf-8
*** Settings ***
Documentation  Etsi tietojenkäsittelyn koulutus XAMK:in verkkosivuilta, 1 failaava ja 1 toimiva
Library       SeleniumLibrary
Resource      ../common-resource.robot
Resource      ../keywords/toiminnot.robot
Test Setup        Avaa selain XAMKin etusivulle
Test Teardown     Sulje selain

*** Test Cases ***
Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma
    [Tags]    jenkins   local   demo    old
    Tarkista että etusivu on auki
    Siirry koulutus välilehdelle
    Run Keyword If    '${CONFIGURATION}' == 'jenkins'    Sulje sharepalkki
    Siirry AMK-tutkinnot välilehdelle
    Hae tietojenkäsittelyn koulutusta
    Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Siirry tietojenkäsittelyn koulutuksen sivulle

Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma suoraan hakukentästä
    [Tags]    jenkins   local   demo    working
    Tarkista että etusivu on auki
    Etsi etusivun hakukentästä tietojenkäsittely
    Tarkista että tietojenkäsittelyn opinnoista kertova sivu on auki
