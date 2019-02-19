coding: utf-8
*** Settings ***
Documentation  Find the "Tietojenkäsittely" field of study from XAMK's website. The first test case is supposed to fail and the other one should succeed.
Library       SeleniumLibrary
Resource      ../common-resource.robot
Resource      ../keywords/toiminnot.robot
Test Setup        Avaa selain XAMKin etusivulle
Test Teardown     Sulje selain

*** Test Cases ***
Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma
    [Tags]    demo    old
    Tarkista että etusivu on auki
    Siirry koulutus välilehdelle
    Siirry AMK-tutkinnot välilehdelle
    Hae tietojenkäsittelyn koulutusta
    Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Siirry tietojenkäsittelyn koulutuksen sivulle

Etsi XAMKin sivuilta tietojenkäsittelyn koulutusohjelma suoraan hakukentästä
    [Tags]    demo    working
    Tarkista että etusivu on auki
    Etsi etusivun hakukentästä tietojenkäsittely
    Tarkista että tietojenkäsittelyn opinnoista kertova sivu on auki
