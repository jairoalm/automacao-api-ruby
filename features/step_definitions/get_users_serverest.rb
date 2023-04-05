Quando('realizar uma chamada get para uma rota \/usuarios') do
    @response = Excon.get($base_uri + '/usuarios')
end
  
Então('validar que foram retornados usuários') do
    # binding.pry
    puts "Response: #{@response}"
    puts "Response body: #{@response.body}"
    puts "Response status: #{@response.status}"
    expect(@response.status).to eql 200
end