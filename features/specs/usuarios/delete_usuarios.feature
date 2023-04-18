#language: pt

@regression
@delete_usuarios
Funcionalidade: Requisições Delete usuários para APIs REST com Excon
    Como uma aplicação teste
    Gostaria de poder realizar chamadas para a API Serverest
    Para poder consumir os seus serviços

    @delete_usuario_valido_200
    Cenário: [DELETE] Deletar um usuário existente
        Dado possuir um novo usuário cadastrado corretamente
        Quando realizar uma chamada delete para a rota "/usuarios"
        Então validar que foi retornado o status code 200 e a mensagem "Registro excluído com sucesso"

    @delete_usuario_invalido_200
    Cenário: [DELETE] Tentar excluir um usuário que não existe
        Dado possuir um id de usuário "usuario_inexistente"
        Quando realizar uma chamada delete para a rota "/usuarios"    
        Então validar que foi retornado o status code 200 e a mensagem "Nenhum registro excluído"