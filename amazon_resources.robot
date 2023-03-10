*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                         https://www.amazon.com.br/
${MENU_ELETRONICO}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia      

*** Keywords ***
Abrir o navegador
    Open Browser
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible   locator=${MENU_ELETRONICO}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICO}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']