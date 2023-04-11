Quando('realizar uma chamada get para uma rota {string}') do |endpoint|
    # @response = Excon.get($base_uri + '/usuarios')    
    endpoint = "#{endpoint}/#{@id}" unless @id.nil?
    @response = @serverest_api.get(endpoint)
    # puts @response.body
    # log @response.body
    log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada post para uma rota {string}') do |endpoint|
    @response = @serverest_api.post(endpoint, @payload)
    log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada delete para a rota {string}') do |endpoint|
    # Usa o id gerado no step "possuir um novo usuário cadastrado corretamente"
    endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.delete(endpoint)
    log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada put para a rota {string}') do |endpoint|
    @endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.put(@endpoint, @payload)  
    log Utils.log_response("GET", endpoint, @response.body)  
end

Então('validar que foi retornado o status code {int} e o schema {string}') do |status_code, schema_name|
    response_json = JSON.parse(@response.body)
    schema = Utils.get_schema(schema_name)
    aggregate_failures do
        expect(@response.status).to eql status_code
        expect(JSON::Validator.validate!(schema, response_json)).to be true
    end
end

Então('validar que foi retornado o status code {int} e a mensagem {string}') do |status_code, message|
    @response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eql status_code       
        expect(@response_json["message"]).to eql message
    end
end