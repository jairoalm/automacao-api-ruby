Dado('possuir um payload para alterar o usuario cadastrado') do
    @nome_anterior = @payload[:nome]
    @payload[:nome] = 'batata'
end
  
Então('validar que o usuario foi alterado com sucesso') do
    steps %{
        Então validar que foi retornado o status code 200 e a mensagem "Registro alterado com sucesso"
    }
    # response_json = JSON.parse(@response.body)
    response_get = JSON.parse(@serverest_api.get(@endpoint).body) # para pegar o que é retornado pelo o body
    aggregate_failures do
        # expect(@response.status).to eql 200 
        # expect(response_json['message']).to eql 'Registro alterado com sucesso'       
        expect(response_get["nome"]).not_to eql @nome_anterior # Valida que o nome anterior alteração não é mais o mesmo.
        expect(response_get["nome"]).to eql "batata" # valida que o nome anterior foi alterado para "batata"        
    end
end