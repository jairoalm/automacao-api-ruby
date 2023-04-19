## Nome do projeto
Projeto de automação de teste com Ruby, Excon, Cucumber e Gherkin para testes de API

### Descrição
Este projeto é uma estrutura de teste automatizado com o objetivo de testar APIs com Ruby, Excon, Cucumber e Gherkin. O objetivo deste projeto é garantir que a API esteja funcionando corretamente e que todas as funcionalidades estejam de acordo com as especificações.

### Pré-requisitos
* Ruby instalado
* Bundler instalado
* Excon instalado
* Cucumber instalado

### Instalação
* Clone este repositório em seu computador
* Execute o comando bundle install para instalar as dependências

### Executando os testes
* Crie um arquivo config.yml e preencha com as informações da API que você deseja testar, utilizando o formato abaixo:

```
api_base_url: https://api.example.com
api_version: v1
api_key: YOUR_API_KEY

```

* Execute o comando cucumber para executar todos os testes da pasta /features

### Arquivos importantes
* features/ - Pasta que contém os arquivos de teste com a sintaxe Gherkin
* features/support/ - Pasta que contém os arquivos de suporte do Cucumber
* features/step_definitions/ - Pasta que contém os arquivos com a implementação dos passos dos cenários. 
* config.yml - Arquivo que contém as informações da API que você deseja testar.
* Gemfile - Arquivo que contém as dependências do projeto

### Contribuindo
Se você deseja contribuir para este projeto, sinta-se à vontade para enviar uma solicitação de pull.

### Estrutura do projeto
O projeto é organizado da seguinte forma:

```
├── .github
|   ├── pipeline.yml
├── features
|   ├── services
|   |   ├── serve_rest.rb
|   ├── specs
|   |   ├── produtos
|   |   |   ├── post_produtos.feature
|   |   ├── usuarios
|   |   |   ├── post_usuarios.feature
|   ├── step_definitions
│   │   ├── commons
|   |   |   ├── common_steps.rb
│   │   ├── produtos
|   |   |   ├── get_produtos.rb
│   │   ├── usuarios
|   |   |   ├── get_usuarios.rb
│   ├── support
│   │   ├── config
│   │   |   ├── local.rb
│   │   |   └── prd.rb
│   │   ├── factory
│   │   |   ├── static
|   |   |   |   ├── local.yml
│   │   |   |   └── prd.yml
|   |   |   ├── dynamic.rb
│   │   |   └── static.rb
|   |   ├── utils
|   |   |   ├── schemas
|   |   |   |   ├── get_produto_200.json
│   │   |   └── utils.rb
│   │   ├── env.rb
│   │   └── hooks.rb
├── reports
|   └── report.html
├── .gitignore
├── cucumber.yml
├── Gemfile
├── Gemfile.lock
└── README.md
```
* features: diretório que contém os arquivos .feature, que possuem a sintaxe Gherkin para descrever os cenários de teste.
* features/support: diretório que contém os arquivos de suporte do Cucumber, como a configuração da aplicação, a definição das funções auxiliares, entre outros.
* features/step_definitions: diretório que contém os arquivos com a implementação dos passos dos cenários.
* .gitignore: arquivo que define quais arquivos e diretórios não serão versionados pelo Git.
* Gemfile: arquivo que define as dependências do projeto.
* Gemfile.lock: arquivo gerado automaticamente que contém as informações das versões específicas de cada dependência instalada.
* README.md: arquivo de documentação do projeto.
* config.yml: arquivo que contém as informações da API que será testada.

### Executando testes específicos
Para executar apenas um cenário específico, utilize o comando cucumber seguido do nome do arquivo .feature e o número da linha do cenário, como no exemplo abaixo:

* cucumber features/my_first_feature.feature

Isso irá executar somente o cenário da linha 8 do arquivo my_first_feature.feature.

### Customizando a configuração da API
Você pode customizar a configuração da API de acordo com a sua necessidade, basta modificar o arquivo config.yml. Você pode adicionar novas informações, como as credenciais de autenticação ou as configurações de ambiente.

### Cobertura de testes
Este projeto utiliza o relatório de cobertura de testes do Cucumber, que pode ser encontrado no arquivo coverage/index.html. O relatório mostra a porcentagem de execução dos cenários de teste e ajuda a identificar possíveis lacunas nos testes.

### Debugging
O projeto possui um recurso de debugging que pode ser habilitado ao executar o comando cucumber com a variável de ambiente DEBUG=true, como no exemplo abaixo:

* DEBUG=true cucumber

Isso irá exibir no console as informações de debug, como as requisições e respostas da API.

### Autor
Seu nome aqui.

### Licença
Este projeto está licenciado sob a Licença MIT - consulte o arquivo LICENSE para obter detalhes.