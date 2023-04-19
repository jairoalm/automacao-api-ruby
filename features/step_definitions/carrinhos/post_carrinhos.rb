Dado('possuir payload com id de produto já cadastrado') do    
    # @id_product = @id    
    # @payload = Factory::Dynamic.new_valid_car(@id)
    # @carrinho[:idProduto] = @id_product 
    @carrinho = {
        "produtos": [
          {
            "idProduto": "nN3ifFikWJYkV4o2",
            "quantidade": 1
          }
        ]
    }
    log @carrinho    
    # binding.pry     
end