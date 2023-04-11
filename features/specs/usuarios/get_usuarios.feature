#language: pt

@regression
@get_usuarios
Funcionalidade: Requisições Get usuários para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

@get_usuarios_200
Cenário: [GET] Realizar Get na rota /usuarios da API Serverest
    Quando realizar uma chamada get para uma rota "/usuarios"
    # Então validar que foram retornados usuários
    Então validar que foi retornado o status code 200 e o schema "get_usuarios_200"

@get_usuarios_id_200
Cenário: [GET] Realizar Get na rota /usuarios/{_id} com Id de usuário válido
    Dado possuir um novo usuário cadastrado corretamente
    # Dado possuir um id de usuário "usuario_valido"
    Quando realizar uma chamada get para uma rota "/usuarios"
    # Então validar que foi retornado o usuário
    Então validar que foi retornado o status code 200 e o schema "get_usuario_200"

@get_usuarios_400
Cenário: [GET] Realizar Get na rota /usuarios/{_id} com Id de usuário inexistente
    Dado possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada get para uma rota "/usuarios"
    # Então validar que não foi retornado usuarios
    Então validar que foi retornado o status code 400 e o schema "get_usuario_400"