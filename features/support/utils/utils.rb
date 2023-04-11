class Utils 
    def self.log_response(verbo, endpoint, body)
        "Retorno da chamada com #{verbo} para o endpoint #{endpoint}: \n #{body.force_encoding('UTF-8')}"
        # log body
    end # mostra no console como as informações estão sendo motadas

    def self.get_schema(schema)
        JSON.parse(File.read(%-#{Dir.pwd}/features/support/utils/schemas/#{schema}.json-))
    end
end