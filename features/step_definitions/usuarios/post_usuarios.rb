Dado('possuir um payload de novo usuario para cadastrar') do
    @payload = Factory::Dynamic.new_valid_user
end

Dado('possuir um novo usuário cadastrado corretamente') do
    steps %{
        Dado possuir um payload de novo usuario para cadastrar
        Quando realizar uma chamada post para uma rota "/usuarios"
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"        
    }
    # Então validar que foi criado um novo usuario
    # Pegar o id do usuário cadastrado
    @id = @response_json["_id"]
end

# Então('validar que foi criado um novo usuario') do
#     @response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 201
#         expect(@response_json["message"]).not_to be nil
#         expect(@response_json["_id"]).not_to be nil
#         expect(@response_json["message"]).to eql "Cadastro realizado com sucesso"
#     end
# end
  
# Então('validar que não foi possível criar um novo usuario') do
#     response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 400        
#         expect(response_json["message"]).not_to be nil
#         expect(response_json["message"]).to eql "Este email já está sendo usado"
#     end
# end