namespace "/api/v1" do
  get "/applies" do
    applies = Apply.all
    [:job_id, :geek_id].each do |filter|
      applies = applies.send(filter, params[filter]) if params[filter]
    end
    collection_to_api(applies)
  end

  get "/apply/:id" do
    apply = Apply.where(id: params[:id]).first
    halt(404, { message: "Document Not Found", status: 404, params_id: params[:id] }.to_json) unless apply
    apply.values.to_json
  end

  post "/apply" do
    apply = Apply.new(request.params)
    halt(422, { message: "Unprocessible Entity", status: 422, params: request.params }.to_json) unless apply
    if apply.save
      status 200
      apply.values.to_json
    else
      raise StandardError.new("In POST '/apply' - Unprocessible Entity 422")
    end
  end

  delete "/apply/:id" do
    apply = Apply.where(id: params[:id]).first
    halt(404, { message: "Document Not Found", status: 404, params_id: params[:id] }.to_json) unless apply
    if apply.delete
      status 204
    else
      raise StandardError.new("In DELETE '/apply/:id' - Unprocessible Entity 422")
    end
  end

  get "/applies_read" do
    collection_to_api(Apply.read)
  end

  get "/applies_unread" do
    collection_to_api(Apply.unread)
  end
end
