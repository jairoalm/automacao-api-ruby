#language: pt

@regression
@put_usuarios
Funcionalidade: Requisições PUT usuarios para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

@put_usuarios_200
Cenário: [PUT] Validar alteração de usuário exsitente com sucesso utilizando Put na rota /usuarios
    Dado possuir um novo usuário cadastrado corretamente
    E possuir um payload para alterar o usuario cadastrado
    Quando realizar uma chamada put para a rota "/usuarios"
    Então validar que o usuario foi alterado com sucesso
    # Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"

@put_usuarios_201
Cenário: [PUT] Validar cadastro de novo usuário 
    Dado possuir um payload de novo usuario para cadastrar
    E possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada put para a rota "/usuarios"
    # Então validar que foi criado um novo usuario
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"

@put_usuarios_400
Cenário: [PUT] Validar que não é possível criar um usuário com e-mail já existente
    Dado possuir um novo usuário cadastrado corretamente
    E possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada put para a rota "/usuarios"
    # Então validar que não foi possível criar um novo usuario  
    Então validar que foi retornado o status code 400 e a mensagem "Este email já está sendo usado"    