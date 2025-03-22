# Testes Automatizados da API Google Maps Distance Matrix

Este repositório contém testes automatizados para a API Google Maps Distance Matrix, desenvolvidos utilizando o Robot Framework. Os testes verificam diferentes cenários de cálculo de distâncias entre localidades, garantindo que a API funcione conforme esperado em diversas condições.

## Funcionalidades

- **Cenários de Teste**:
  - Validação do cálculo de distância entre duas cidades (ex.: Belo Horizonte e Curitiba).
  - Teste do contrato da API validando o JSON Schema retornado
  - Teste do comportamento da API ao omitir a chave de autenticação.
  - Teste do comportamento da API ao omitir a cidade de origem.

- **Validações**:
  - Códigos de status HTTP e mensagens de resposta.
  - Conteúdo da resposta, incluindo endereços de origem e destino.
  - Mensagens de erro para requisições inválidas ou incompletas.

## Estrutura do Projeto

- `distanceMatrix/requests/`: Contém palavras-chave reutilizáveis e definições de requisições para interagir com a API.
- `distanceMatrix/tests/`: Contém os casos de teste que validam o funcionamento da API.

## Como Executar os Testes

1. Instale o [Robot Framework](https://robotframework.org/).
2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/api-tests-distance-matrix.git