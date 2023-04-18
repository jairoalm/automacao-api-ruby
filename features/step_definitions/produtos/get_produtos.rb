Dado('possuir um id de produto {string}') do |user_type|  
    @id = Factory::Static.Static_data(user_type)
    # log Utils.log_response("GET", @id, @response.body)
    # @id = @response_json["_id"]
    # binding.pry    
end
  