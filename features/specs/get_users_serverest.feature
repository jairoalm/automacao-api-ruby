#language: pt

Funcionalidade: Requisições para APIs REST com Excon

Cenário: Realizar Get na rota /usuarios da API Serverest
    Quando realizar uma chamada get para uma rota /usuarios
    Então validar que foram retornados usuários