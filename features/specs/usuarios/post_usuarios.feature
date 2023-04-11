#language: pt

@regression
@post_usuarios
Funcionalidade: Requisições POST usuarios para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

@post_usuarios_201
Cenário: [POST] Cadastrar um usuário com sucesso pela rota /usuários
    Dado possuir um payload de novo usuario para cadastrar
    Quando realizar uma chamada post para uma rota "/usuarios"
    # Então validar que foi criado um novo usuario
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"

@post_usuarios_400
Cenário: [POST] Tentar cadastrar um usuário com e-mail já utilizado pela rota /usuários
    # Dado possuir um payload de um usuario já cadastrado
    Dado possuir um novo usuário cadastrado corretamente
    Quando realizar uma chamada post para uma rota "/usuarios"
    # Então validar que não foi possível criar um novo usuario
    Então validar que foi retornado o status code 400 e a mensagem "Este email já está sendo usado"