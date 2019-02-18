*** Settings ***
Documentation  XAMK - tietojenkäsittely - avainsanat
Resource      ../common-resource.robot

*** Keywords ***
Avaa selain XAMKin etusivulle
    Open Browser    ${URL_XAMK}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Tarkista että etusivu on auki
    Title Should Be   Etusivu - XAMK

Siirry koulutus välilehdelle
    Wait Until Page Contains Element    xpath=.//div[@class='menu']//a[contains(., 'Koulutus')]                                                 timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//div[@class='menu']//a[contains(., 'Koulutus')]

Siirry AMK-tutkinnot välilehdelle
    Wait Until Page Contains Element    xpath=.//h2[contains(., 'AMK-tutkinnot')]                                                               timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//h2[contains(., 'AMK-tutkinnot')]/following-sibling::a[@class='btn'][contains(., 'Lue lisää')]

Hae tietojenkäsittelyn koulutusta
    #Valitse koulutusalaksi ICT-ala
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Koulutusala')]                                                               timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//span[contains(., 'Koulutusala')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='ict-ala']           timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='ict-ala']
    #Valitse kaupungiksi Mikkeli
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Kaupunki')]                                                                  timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//span[contains(., 'Kaupunki')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='mikkeli']           timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='mikkeli']
    #Valitse hakuajaksi kevät 2018
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Hakuaika')]                                                                  timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//span[contains(., 'Hakuaika')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='14-3-28-3-2018']    timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='14-3-28-3-2018']
    #Valitse kieleksi Suomi
    Wait Until Page Contains Element    xpath=.//span[contains(., 'Kieli')]                                                                     timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//span[contains(., 'Kieli')]
    Wait Until Element Is Visible       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='fi']                timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//select[@class='facetwp-dropdown select2-hidden-accessible']/option[@value='fi']
    Paina Etsi nappulaa

Paina Etsi nappulaa
    Click Button    Etsi

Tarkista että tietojenkäsittelyn koulutus nousee hakutuloksiin
    Wait Until Page Contains Element    xpath=.//section[@class='listing degrees']//a[contains(., 'Tradenomi (AMK), tietojenkäsittely')]    timeout=${TIMEOUT_GLOBAL}

Siirry tietojenkäsittelyn koulutuksen sivulle
    Wait Until Page Contains Element    xpath=.//div[@class='hover']/a[contains(., 'Lue lisää')]          timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//div[@class='hover']/a[contains(., 'Lue lisää')]
    Wait Until Page Contains Element    xpath=.//h1[contains(., 'Tradenomi (AMK), tietojenkäsittely')]    timeout=${TIMEOUT_GLOBAL}
    Wait Until Page Contains            IT-tradenomi - sovelluskehittäjä                                  timeout=${TIMEOUT_GLOBAL}

Etsi etusivun hakukentästä tietojenkäsittely
    Wait Until Page Contains Element    xpath=.//form[@role='search']//input[@placeholder='Hae xamk.fi -sivustolta']                           timeout=${TIMEOUT_GLOBAL}
    Input Text                          xpath=.//form[@role='search']//input[@placeholder='Hae xamk.fi -sivustolta']    Tietojenkäsittely
    Wait Until Page Contains Element    xpath=.//div[@id='addsearch-results-mid']//a[contains(text(), 'Tradenomi (AMK), tietojenkäsittely')]   timeout=${TIMEOUT_GLOBAL}
    Click Element                       xpath=.//div[@id='addsearch-results-mid']//a[contains(text(), 'Tradenomi (AMK), tietojenkäsittely')]

Tarkista että tietojenkäsittelyn opinnoista kertova sivu on auki
    Wait Until Page Contains Element    xpath=.//h1[contains(text(), 'Tradenomi (AMK), tietojenkäsittely')]                                    timeout=${TIMEOUT_GLOBAL}
    Title Should Be                     Tradenomi (AMK), tietojenkäsittely - XAMK
    Page Should Contain                 Päiväopiskelu
    Page Should Contain                 Verkko-opiskelu
