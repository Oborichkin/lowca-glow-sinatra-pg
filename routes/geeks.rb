namespace "/api/v1" do
  get "/geeks" do
    geeks = Geek.all
    collection_to_api(geeks)
  end

  get "/geek/:id" do
    geek = Geek.where(id: params[:id]).first
    halt(404, { message: "Document Not Found", status: 404, params_id: params[:id] }.to_json) unless geek
    geek.values.to_json
  end

  get "/geek/:id/applies" do
    applies = Geek.geek_applies(params[:id])
  end

  post "/geek" do
    geek = Geek.new(request.params)
    halt(422, { message: "Unprocessible Entity", status: 422, params: request.params }.to_json) unless geek
    if geek.save
      status 200
      geek.values.to_json
    else
      raise StandardError.new("In POST '/geek/:id' - Unprocessible Entity 422")
    end
  end

  delete "/geek/:id" do
    geek = Geek.where(id: params[:id]).first
    halt(404, { message: "Document Not Found", status: 404, params_id: params[:id] }.to_json) unless geek
    if geek.delete
      status 204
    else
      raise StandardError.new("In DELETE '/geek/:id' - Unprocessible Entity 422")
    end
  end
end
