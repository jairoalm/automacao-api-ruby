#language: pt

@regression
@regression_produtos
@post_produtos
Funcionalidade: Requisições Post produtos para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

@excluir_usuario
@post_produtos_201
Cenário: [Post] Cadastrar um produto com sucesso com post na API Serverest
    Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
    E possuir um payload de um produto válido
    Quando realizar uma chamada post para uma rota "/produtos"
    # Então validar que um novo produto foi cadastrado com sucesso
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"

@excluir_usuario
@post_produtos_400
Cenário: [Post] Tentar cadastrar um produto com nome já cadastrado
    Dado possuir um produto cadastrado
    E possuir payload com um nome de produto já cadastrado
    Quando realizar uma chamada post para uma rota "/produtos"
    # Então validar que não foi possível cadastrar um produto com nome repetido
    Então validar que foi retornado o status code 400 e a mensagem "Já existe produto com esse nome"

@post_produtos_401
Cenário: [Post] Tentar cadastrar um produto sem token setado
    Dado possuir um payload de um produto válido
    Quando realizar uma chamada post para uma rota "/produtos"
    # Então validar que foi solicitado um token para cadastrar os produtos
    Então validar que foi retornado o status code 401 e a mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

@post_produtos_403
Cenário: [Post] Tentar cadastrar um produto sem ser administrador
    Dado possuir um token de acesso setado para um usuário do tipo "usuario_nao_admin"
    E possuir um payload de um produto válido
    Quando realizar uma chamada post para uma rota "/produtos"
    # Então validar que usuários não administrador não podem cadastrar produtos
    Então validar que foi retornado o status code 403 e a mensagem "Rota exclusiva para administradores"