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
    Company.company_jobs(params[:name])
  end

  post "/companies" do
    company = Company.create(params)
    company.nil? ? [].to_json : company.values.to_json
  end
end
