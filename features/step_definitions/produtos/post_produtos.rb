Dado('possuir um token de acesso setado para um usuário do tipo {string}') do |user_type|
    steps %{
        Dado possuir um payload de novo usuario do tipo "#{user_type}" para cadastrar
        Quando realizar uma chamada post para uma rota "/usuarios"
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"        
    }
    # Então validar que foi criado um novo usuario
    payload = {
        'email': @payload[:email],
        'password': @payload[:password]
    }   
    @serverest_api.set_access_token(payload)
end

Dado('possuir um payload de novo usuario do tipo {string} para cadastrar') do |user_type|
    @payload = Factory::Dynamic.new_valid_user(user_type)
end

Dado('possuir um payload de um produto válido') do
    @payload = Factory::Dynamic.new_valid_product
end

Dado('possuir um produto cadastrado') do
    steps %{
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        E possuir um payload de um produto válido
        Quando realizar uma chamada post para uma rota "/produtos"        
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    }
    # Então validar que um novo produto foi cadastrado com sucesso
end
  
Dado('possuir payload com um nome de produto já cadastrado') do
    # Pegando o paylod que foi cadastrado em "possuir um payload de um produto válido" 
    register_product_name = @payload[:nome]
    # Gerando um novo paylod
    @payload = Factory::Dynamic.new_valid_product
    # Substituo o nome do novo payload por outro
    @payload[:nome] = register_product_name
end

# Então('validar que um novo produto foi cadastrado com sucesso') do
#     # 1 - transformar o body do obejto de response do Excon em Json
#     @response_json = JSON.parse(@response.body) # No momento que é feita a request joga o body para essa variável @response
#     aggregate_failures do
#         # 2 - Validar o status code do objeto de response
#         expect(@response.status).to eql 201
#         # 3 - validar que o objeto "message" não estar vazio
#         expect(@response_json["message"]).not_to be nil 
#         # 4 - Validar que a mensagem é de "Cadastro realizado com sucesso"     
#         expect(@response_json["message"]).to eql "Cadastro realizado com sucesso"
#         # 5 - validar que o objeto "_id" não estar vazio
#         expect(@response_json["_id"]).not_to be nil        
#     end
# end

# Então('validar que não foi possível cadastrar um produto com nome repetido') do
#     response_json = JSON.parse(@response.body) # No momento que é feita a request joga o body para essa variável @response
#     aggregate_failures do
#         # 2 - Validar o status code do objeto de response
#         expect(@response.status).to eql 400
#         # 3 - validar que o objeto "message" não estar vazio
#         expect(response_json["message"]).not_to be nil 
#         # 4 - Validar que a mensagem é de "Cadastro realizado com sucesso"     
#         expect(response_json["message"]).to eql "Já existe produto com esse nome"            
#     end
# end

# Então('validar que foi solicitado um token para cadastrar os produtos') do
#       # 1 - transformar o body do obejto de response do Excon em Json
#     response_json = JSON.parse(@response.body) # No momento que é feita a request joga o body para essa variável @response
#     aggregate_failures do
#         # 2 - Validar o status code do objeto de response
#         expect(@response.status).to eql 401
#         # 3 - validar que o objeto "message" não estar vazio
#         expect(response_json["message"]).not_to be nil 
#         # 4 - Validar que a mensagem é de "Cadastro realizado com sucesso"     
#         expect(response_json["message"]).to eql "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"             
#     end
# end

# Então('validar que usuários não administrador não podem cadastrar produtos') do
#       # 1 - transformar o body do obejto de response do Excon em Json
#     @response_json = JSON.parse(@response.body) # No momento que é feita a request joga o body para essa variável @response
#     aggregate_failures do
#         # 2 - Validar o status code do objeto de response
#         expect(@response.status).to eql 403
#         # 3 - validar que o objeto "message" não estar vazio
#         expect(@response_json["message"]).not_to be nil 
#         # 4 - Validar que a mensagem é de "Cadastro realizado com sucesso"     
#         expect(@response_json["message"]).to eql "Rota exclusiva para administradores"             
#     end
# end