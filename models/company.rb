class Company < Sequel::Model
  def to_api
    {
      id: id.to_s,
      name: name,
      location: location,
    }
  end

  dataset_module do
    def by_name(name)
      where(name: /#{name}/i) if name
    end
  end

  dataset_module do
    def by_location(location)
      where(location: /#{location}/i) if location
    end
  end

  def self.company_jobs(name)
    company = Company.by_name(name)
    company_id = company.map(:id)[0] unless company == [] || company == nil
    company_jobs = Job.company_jobs(company_id) unless company_id.nil?
    company_jobs.nil? ? [].to_json : collection_to_api(company_jobs)
  end

end
