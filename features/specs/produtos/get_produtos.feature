#language: pt

@regression
@regression_produtos
@get_produtos
Funcionalidade: Requisições GET produtos para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

@get_produtos_200
Cenário: [GET] Realizar Get na rota /produtos da API Serverest
    Quando realizar uma chamada get para uma rota "/produtos"    
    Então validar que foi retornado o status code 200 e o schema "get_produtos_200"

@get_produtos_id_200
Cenário: [GET] Realizar Get na rota /produtos/{_id} com Id de usuário válido
    Dado possuir um produto cadastrado   
    Quando realizar uma chamada get para uma rota "/produtos"    
    Então validar que foi retornado o status code 200 e o schema "get_produto_id_200"

@get_produtos_400
Cenário: [GET] Realizar Get na rota /produtos/{_id} com Id de usuário inexistente
    Dado possuir um id de produto "produto_inexistente"
    Quando realizar uma chamada get para uma rota "/produtos"    
    Então validar que foi retornado o status code 400 e o schema "get_produto_400"
    E validar que foi retornado o status code 400 e a mensagem "Produto não encontrado"