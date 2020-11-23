namespace "/api/v1" do
  require "json"

  get "/companies" do
    companies = Company.all
    return collection_to_api(companies) if params.empty?

    if params["name"]
      companies_all = Company.by_name(params["name"])
      if params["location"]
        companies = companies_all.by_location(params["location"])
      else
        companies = companies_all
      end
    else
      if params["location"]
        companies = Company.by_location(params["location"])
      end
    end
    return collection_to_api(companies)
  end

  get "/company/:id" do
    company = Company.where(id: params[:id].to_i)
    company.to_a[0].values.to_json
  end

  get "/company_jobs" do
    jobs = Company.company_jobs(params[:name])
  end

  post "/company" do
    company = Company.new(request.params)
    halt(422, { message:'Unprocessible Entity', status: 422, params: request.params}.to_json) unless company
    if company.save
      status 200
      company.values.to_json
    else
      raise StandardError.new("In POST '/company' - Unprocessible Entity 422")
    end
  end

  delete '/company/:id' do
    company = Company.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    if company.delete
      status 204
    else
      raise StandardError.new("In DELETE '/company/:id' - Unprocessible Entity 422")
    end
  end

end
