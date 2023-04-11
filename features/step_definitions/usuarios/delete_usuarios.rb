# Então('validar que o usuário foi excluído com sucesso') do
#     response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 200        
#         expect(response_json["message"]).not_to be nil
#         expect(response_json["message"]).to eql "Registro excluído com sucesso"
#     end
# end
  
# Então('validar que não é possível excluir um usuário inexistente') do
#     response_json = JSON.parse(@response.body)
#     aggregate_failures do
#         expect(@response.status).to eql 200        
#         expect(response_json["message"]).not_to be nil
#         expect(response_json["message"]).to eql "Nenhum registro excluído"
#     end
# end