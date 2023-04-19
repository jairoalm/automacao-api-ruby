#language: pt

@regression
@regression_carrinhos
@post_carrinhos
Funcionalidade: Requisições Get carrinhos para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a AsPI Serverest
    Para poder consumir os seus serviços

    @post_carrinhos_200
    Cenário: [POST] Realizar Post na rota /carrinhos da API Serverest 
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"       
        # Dado possuir um produto cadastrado
        Quando possuir payload com id de produto já cadastrado
        E realizar uma chamada post para uma rota "/carrinhos"
        # Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    
    @post_carrinhos_405
    Cenário: [POST] Realizar Post numa rota /invalida da API Serverest 
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"       
        # Dado possuir um produto cadastrado
        Quando possuir payload com id de produto já cadastrado
        E realizar uma chamada post para uma rota "/invalida"
        Então validar que foi retornado o status code 405 e a mensagem "Não é possível realizar POST em /invalida. Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las."