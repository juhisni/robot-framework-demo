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
    [Tags]    demo    qa
    Avaa selain XAMKin etusivulle
    Tarkista että etusivu on auki
    Siirry koulutus välilehdelle
    Siirry AMK-tutkinnot välilehdelle
    Hae tietojenkäsittelyn koulutusta
    Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Siirry tietojenkäsittelyn koulutuksen sivulle
    [Teardown]    Sulje selain
