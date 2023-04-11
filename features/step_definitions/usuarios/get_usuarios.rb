Dado('possuir um id de usuário {string}') do |user_type|  
    @id = Factory::Static.Static_data(user_type)    
end


# Então('validar que foram retornados usuários') do
#     response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 200
#         # expect(response_json["quantidade"]).to eql 27
#         expect(response_json["usuarios"].class).to be_kind_of(Integer.class)
#         expect(response_json["usuarios"].size).to be > 1
#         expect(response_json["usuarios"].class).to be_kind_of(Array.class)
#     end
# end

# Então('validar que foi retornado status code {int} e o schema {string}') do |status_code, schema_name|
#     response_json = JSON.parse(@response.body)
#     schema = Utils.get_schema(schema_name)
#     aggregate_failures do
#         expect(@response.status).to eql status_code
#         expect(JSON::Validator.validate!(schema, response_json)).to be true
#         # expect(response_json["nome"]).not_to be nil
#         # expect(response_json["email"]).not_to be nil
#         # expect(response_json["password"]).not_to be nil
#         # expect(response_json["administrador"]).not_to be nil
#         # expect(response_json["_id"]).not_to be nil
#     end
# end

# Então('validar que não foi retornado usuarios') do
#     response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 400
#         expect(response_json["message"]).to eql "Usuário não encontrado"
#     end
# end