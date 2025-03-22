*** Settings ***
Documentation   Documentação da API: https://developers.google.com/maps/documentation/distance-matrix/distance-matrix
Resource        ../requests/matrixDistance-requests.robot


***Test Cases ***

Verifica retorno de GET distância entre BH x Curitiba 
    [Tags]    TESTE001

    Dado que eu conecto à API do Google Maps
    E requisito a distância entre BH x Curitiba
    E confiro o status code  200
    E confiro o reason   OK
    E confiro se cidade de origem é BH 

Verifica JSON de retorno de GET distância entre BH x Curitiba 
    [Tags]    TESTE001

    Dado que eu conecto à API do Google Maps
    E requisito a distância entre BH x Curitiba
    E confiro o status code  200
    E confiro o reason   OK
    E valido o JSON Schema da resposta

Verifica retorno de GET distância entre BH x Curitiba sem passar chave
    [Tags]    TESTE002

    Dado que eu conecto à API do Google Maps 
    E requisito a distância entre BH x Curitiba sem informar chave
    E confiro o status code  200
    E confiro a mensagem   You must use an API key to authenticate each request to Google Maps Platform APIs. For additional information, please refer to http://g.co/dev/maps-no-account

Verifica retorno de GET distância sem passar a cidade de origem
    [Tags]    TESTE003

    Dado que eu conecto à API do Google Maps 
    E requisito a distância entre BH x Curitiba sem informar a origem 
    E confiro o status code  200
    E confiro o endereço de origem  []


