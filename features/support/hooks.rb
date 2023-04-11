Before do
    @serverest_api = ServeRest.new
end

# After('@excluir_produtos_usuarios') do
#     endpoint_product = "/produtos/#{@id_product}"
#     endpoint_user = "usuarios/#{@user_id}"
#     @serverest_api.delete(endpoint_product)
#     @serverest_api.delete(endpoint_user)
# end

After('@excluir_usuario') do
    endpoint_user = "/usuarios/#{@user_id}"
    @response_after_user = @serverest_api.delete(endpoint_user)
end