*** Settings ***

Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${name}       Cecilia Andrade
${email}    cecilia@gmail.com
${phone}    999999999
${textarea}    Rua Av Rio Branco, N 1
@{Dias_da_semana}    Domingo    Segunda    Terca    Quarta    Quinta    Sexta    Sabado
&{Cadastro}    nome=Cecilia    email=candrade@gmail.com    mae=Maria do Carmo


*** Keywords ***
Acessar a aplicacao
   Open Browser        https://testautomationpractice.blogspot.com/    chrome

    Wait Until Element Is Enabled      xpath://span[text()="For Selenium, Cypress & Playwright"]        5

    
*** Test Cases ***
Preencher formulario
    [Tags]        form

    ${DATA_SISTEMA}        Get Current Date    result_format=%m-%d-%y

    Acessar a aplicacao

    Input Text                       xpath://input[@id="name"]           ${name}
    Input Text                       xpath://input[@id="email"]          ${email}
    Input Text                       xpath://input[@id="phone"]          ${phone}
    Input Text                       xpath://textarea[@id="textarea"]    ${textarea}
    
    Click Element                    xpath://input[@id="male"]
    Select Checkbox                  xpath://div//input[@id="sunday"]
    Select Checkbox                  xpath://div//input[@id="saturday"]

    Select From List By Value        xpath://select[@id="country"]        china
    Select From List By Index        xpath://select[@id="colors"]        2    4
    Select From List By Label        xpath://select[@id="animals"]       Fox    Deer

    Input Text                       xpath://input[@id="datepicker"]     ${DATA_SISTEMA}
    Click Element                    //input[@name="SelectedDate"]
    Select From List By Value        //select[@data-handler="selectMonth"]       3
    Select From List By Value        //select[@data-handler="selectYear"]        2024
    Click Element                    //a[@data-date="15"]

    Input Text                       //input[@id="start-date"]        ${DATA_SISTEMA}
    Input Text                       //input[@id="end-date"]          ${DATA_SISTEMA}

    Choose File                    //input[@id="singleFileInput"]     ${EXECDIR}/efb18d9f-a1e6-4646-9262-2b882d34cd72.jpeg
    Choose File                    //input[@id="multipleFilesInput"]     ${EXECDIR}/efb18d9f-a1e6-4646-9262-2b882d34cd72.jpeg

    Log To Console    ${DATA_SISTEMA}
    Capture Page Screenshot
    Sleep    10

    
Analisando variaveis
    [Tags]    var
    Log To Console    ${name}
    Log To Console    ${Dias_da_semana[6]}
    Log To Console    ${Cadastro.mae}