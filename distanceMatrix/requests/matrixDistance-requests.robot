*** Settings ***
Resource        ../resources/baseResources.robot
Library         Collections
Library         JSONLibrary

*** Variables ***
${endpoint}                 distancematrix/json?
&{parameters}=              origins=Belo Horizonte
...                         destinations=Curitiba
...                         key=#########
&{data}=                    destination_addresses=['Curitiba, State of Paraná, Brazil']
...                         origin_addresses=['Belo Horizonte, State of Minas Gerais, Brazil']
...                         error_message=You must use an API key to authenticate each request to Google Maps Platform APIs. For additional information, please refer to http://g.co/dev/maps-no-account

*** Keywords ***
E requisito a distância entre BH x Curitiba
    ${response}=    GET On Session      distanceMatrix     ${endpoint}     params=${parameters}     expected_status=any  
    Log             ${response.text}
    Set Test Variable   ${response}

E requisito a distância entre BH x Curitiba sem informar chave
    &{params}=  Create Dictionary               origins=Belo Horizonte
    ...                                         destinations=Curitiba
    ${response}=    GET On Session      distanceMatrix     ${endpoint}     params=${params}     expected_status=any  
    Log             ${response.text}
    Set Test Variable   ${response}

E requisito a distância entre BH x Curitiba sem informar a origem 
    &{params}=  Create Dictionary               destinations=Curitiba
    ...                                         key=AIzaSyC60GRFOVjX0WLKKwgDT44VAAP0XPZr_uM
    ${response}=    GET On Session      distanceMatrix     ${endpoint}     params=${params}     expected_status=any  
    Log             ${response.text}
    Set Test Variable   ${response}

E confiro se cidade de origem é BH 
    Should Be Equal As Strings     ${response.json()['origin_addresses']}      ${data.origin_addresses}

E confiro a mensagem 
    [Arguments]     ${mensagemDesejada}         #Passar qual status tem que ser
    Should Be Equal As Strings      ${response.json()['error_message']}     ${mensagemDesejada}                      
    

E confiro o endereço de origem  
    [Arguments]     ${origemDesejada}
    Should Be Equal As Strings      ${response.json()['origin_addresses']}     ${origemDesejada}


E valido o JSON Schema da resposta   
    Validate Json By Schema File    ${response.json()}     ../data/schema.json