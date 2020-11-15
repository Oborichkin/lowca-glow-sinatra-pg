class Job < Sequel::Model
  def to_api
    {
          id: id,
          name: name,
          company_id: company_id,
          place: place,
    }
  end

  def self.company_jobs(company_id)
    where(company_id: company_id)
  end
end
