*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${URL_API}                  https://maps.googleapis.com/maps/api/
            
*** Keywords ***
###SETUP
Dado que eu conecto à API do Google Maps   

    Create Session  distanceMatrix  ${URL_API}    disable_warnings=1  


###VERIFICAÇÕES
E confiro o status code
    [Arguments]     ${StatusCodeDesejado}          #Passar qual status tem que ser
    Should Be Equal As Strings      ${response.status_code}     ${StatusCodeDesejado}       #Comparando se o status code que ta vindo da request é igual ao que desejo 

E confiro o reason
    [Arguments]     ${ReasonDesejado}         #Passar qual status tem que ser
    Should Be Equal As Strings      ${response.reason}     ${ReasonDesejado}       #Comparando se o status code que ta vindo da request é igual ao que desejo 

