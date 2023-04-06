class ServeRest
    include Excon
    attr_accessor :base_uri

    def initialize
        self.base_uri = $base_uri
        @headers = { 'Content-Type' => 'application/json' }
    end
    def get(endpoint)
        Excon.get(
            base_uri + endpoint,
            headers: @headers
        )
    end
    
    def post(endpoint, payload)
        Excon.post(
            base_uri + endpoint,
            headers: @headers,
            body: payload.to_json
        )
    end

    def delete(endpoint)
        Excon.delete(
            base_uri + endpoint,
            headers: @headers
        )
    end

    def put(endpoint, payload)
        Excon.put(
            base_uri + endpoint,
            headers: @headers,
            body: payload.to_json
        )
    end
    # Lógica para pegar o token do usuário
    def set_access_token(payload)
        # response = post('/login', payload)
        # response_json = JSON.parse(response.body)
        # token = response_json['Authorization']

        @headers['Authorization'] = JSON.parse(post('/login', payload).body)['authorization']        
        #binding.pry
    end
end