*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${login}       Admin
${password}    admin123
@{Dias_da_semana}    Domingo    Segunda    Terca    Quarta    Quinta    Sexta    Sabado
&{Cadastro}    nome=Cecilia    email=candrade@gmail.com    mae=Maria do Carmo

*** Keywords ***
Acessar a aplicacao
   Open Browser        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome

    Wait Until Element Is Enabled      xpath://input[@name="username"]        10

    Input Text            xpath://input[@name="username"]      ${login}
    Input Text            xpath://input[@name="password"]      ${password}
    Click Button          xpath://button[text()=" Login "]
    Sleep    3
    Page Should Contain Image        //img[@src="/web/images/orangehrm-logo.png?v=1721393199309"]
    Capture Page Screenshot


*** Test Cases ***
Logar com User e Password Corretos
    [Tags]        logar
 
    Acessar a aplicacao
    Click Link                       //a[@href="/web/index.php/admin/viewAdminModule"]
    Sleep    3
    Element Should Be Visible        //h6[text()="User Management"]
    Sleep    3

    
Analisando variaveis
    [Tags]    var
    Log To Console    ${login}
    Log To Console    ${Dias_da_semana[6]}
    Log To Console    ${Cadastro.mae}


