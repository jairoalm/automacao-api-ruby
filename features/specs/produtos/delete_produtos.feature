#language: pt

@regression
@regression_produtos
@delete_produtos
Funcionalidade: Requisições Delete produto para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

    @delete_produto_valido_200
    Cenário: [DELETE] Deletar um produto existente
        Dado possuir um produto cadastrado
        Quando realizar uma chamada delete para a rota "/produtos"
        Então validar que foi retornado o status code 200 e a mensagem "Registro excluído com sucesso"
    
    @delete_produto_invalido_200
    Cenário: [DELETE] Tentar excluir um usuário que não existe
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        E possuir um id de produto "produto_inexistente"
        Quando realizar uma chamada delete para a rota "/produtos"        
        Então validar que foi retornado o status code 200 e a mensagem "Nenhum registro excluído"

    # @delete_produto_no_carrinho_400
    # Cenário: [DELETE] Tentar excluir um produto sem token de acesso
    #     E possuir um id de produto "produto_inexistente"
    #     Quando realizar uma chamada delete para a rota "/produtos"        
    #     Então validar que foi retornado o status code 400 e a mensagem "Não é permitido excluir produto que faz parte de carrinho"

    @delete_produto_sem_token_401
    Cenário: [DELETE] Tentar excluir um produto sem token de acesso
        Dado possuir um id de produto "produto_inexistente"
        Quando realizar uma chamada delete para a rota "/produtos"        
        Então validar que foi retornado o status code 401 e a mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

    @delete_produto_valido_403
    Cenário: [Delete] Tentar deletar um produto existente sem ser administrador
        Dado possuir um produto cadastrado
        E possuir um token de acesso setado para um usuário do tipo "usuario_nao_admin"       
        Quando realizar uma chamada delete para a rota "/produtos"
        Então validar que foi retornado o status code 403 e a mensagem "Rota exclusiva para administradores"
    
    @delete_produto_invalido_403
    Cenário: [Delete] Tentar deletar um produto inválido sem ser administrador
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_nao_admin"
        E possuir um id de produto "produto_inexistente"        
        Quando realizar uma chamada delete para a rota "/produtos"
        Então validar que foi retornado o status code 403 e a mensagem "Rota exclusiva para administradores"