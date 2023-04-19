#language: pt

@regression
@regression_carrinhos
@get_carrinhos
Funcionalidade: Requisições Get carrinhos para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

    @get_carrinhos_200
    Cenário: [GET] Realizar Get na rota /carrinhos da API Serverest
        Quando realizar uma chamada get para uma rota "/carrinhos"
        Então validar que foi retornado o status code 200 e o schema "get_carrinhos_200"    

    @get_carrinho_id_200
    Cenário: [GET] Realizar Get na rota /carrinhos/{_id} com Id de usuário válido
        Dado possuir um produto cadastrado        
        Quando realizar uma chamada get para uma rota "/carrinhos"    
        # Então validar que foi retornado o status code 200 e o schema "get_produto_id_200"
        
    @get_carrinhos_400
    Cenário: [GET] Realizar Get na rota /carrinhos/{_id} com Id de carrinho inexistente
        Dado possuir um id de usuário "carrinho_inexistente"
        Quando realizar uma chamada get para uma rota "/carrinhos"
        Então validar que foi retornado o status code 400 e o schema "get_carrinhos_400"
        E validar que foi retornado o status code 400 e a mensagem "Carrinho não encontrado"