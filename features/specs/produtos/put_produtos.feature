#language: pt

@regression
@put_produtos
Funcionalidade: Requisições PUT produtos para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

    @put_produtos_200
    Cenário: [PUT] Validar alteração de usuário exsitente com sucesso utilizando Put na rota /produtos
        Dado possuir um produto cadastrado
        E possuir payload com um nome de produto já cadastrado
        Quando realizar uma chamada put para a rota "/produtos"    
        Então validar que foi retornado o status code 200 e a mensagem "Registro alterado com sucesso"   

    @put_produtos_201
    Cenário: [PUT] Validar cadastro de novo produto 
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        E possuir um payload de um produto válido
        E possuir um id de produto "produto_inexistente"
        Quando realizar uma chamada put para a rota "/produtos"        
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"    

    @put_produtos_400
    Cenário: [PUT] Validar que não é possível criar um usuário com e-mail já existente
        Dado possuir um produto cadastrado
        E possuir um id de produto "produto_inexistente"
        Quando realizar uma chamada put para a rota "/produtos"         
        Então validar que foi retornado o status code 400 e a mensagem "Já existe produto com esse nome"    

    @put_produtos_401
    Cenário: [Post] Tentar alterar um produto sem token setado
        Dado possuir um payload de um produto válido
        E possuir um id de produto "produto_inexistente"
        Quando realizar uma chamada put para a rota "/produtos"
        Então validar que foi retornado o status code 401 e a mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

    @put_produtos_405
    Cenário: [Post] Tentar alterar um produto informar id
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        Dado possuir um payload de um produto válido
        Quando realizar uma chamada put para a rota "/produtos"
        Então validar que foi retornado o status code 405 e a mensagem "Não é possível realizar PUT em /produtos/. Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las."  