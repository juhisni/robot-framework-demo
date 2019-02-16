*** Settings ***
Documentation  Kirjautumisen avainsanat
Resource      ../common-resource.robot

*** Keywords ***
Avaa selain XAMKin etusivulle
    Open Browser    ${URL_XAMK}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Tarkista että etusivu on auki
    Title Should Be   Etusivu - XAMK

Siirry koulutus välilehdelle
    Wait Until Page Contains Element    xpath=.//div[@class='menu']//a[contains(., 'Koulutus')]
    Click Element                       xpath=.//div[@class='menu']//a[contains(., 'Koulutus')]

Siirry AMK-tutkinnot välilehdelle
    Wait Until Page Contains Element    xpath=.//h2[contains(., 'AMK-tutkinnot')]
    Click Element                       xpath=.//h2[contains(., 'AMK-tutkinnot')]/following-sibling::a[@class='btn'][contains(., 'Lue lisää')]

Hae tietojenkäsittelyn koulutusta
    #Valitse koulutusalaksi ICT-ala
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Koulutusala')]
    Click Element                       xpath=.//span[contains(., 'Koulutusala')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='ict-ala']
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='ict-ala']
    #Valitse kaupungiksi Mikkeli
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Kaupunki')]
    Click Element                       xpath=.//span[contains(., 'Kaupunki')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='mikkeli']
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='mikkeli']
    #Valitse hakuajaksi kevät 2018
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Hakuaika')]
    Click Element                       xpath=.//span[contains(., 'Hakuaika')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='14-3-28-3-2018']
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='14-3-28-3-2018']
    #Valitse kieleksi Suomi
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Kieli')]
    Click Element                       xpath=.//span[contains(., 'Kieli')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='fi']
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='fi']
    Paina Etsi nappulaa

Paina Etsi nappulaa
    Click Button    Etsi

Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Wait Until Page Contains Element    xpath=.//section[@class='listing degrees']//a[contains(., 'Tradenomi (AMK), tietojenkäsittely')]

Siirry tietojenkäsittelyn koulutuksen sivulle
    Wait Until Page Contains Element    xpath=.//div[@class='hover']/a[contains(., 'Lue lisää')]
    Click Element                       xpath=.//div[@class='hover']/a[contains(., 'Lue lisää')]
    Wait Until Page Contains Element    xpath=.//h1[contains(., 'Tradenomi (AMK), tietojenkäsittely')]
    Wait Until Page Contains            IT-tradenomi - sovelluskehittäjä
