namespace '/api/v1' do

    get '/jobs' do
      jobs = Job.all
      [:place, :name].each do |filter|
        jobs = jobs.send(filter, params[filter]) if params[filter]
      end
      collection_to_api(jobs)
    end

    get '/job/:id' do
      job = Job.where(id: params[:id]).first
      halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
      job.values.to_json
    end

    get '/jobs_company/:name' do
      company = Company.where(name: params[:name]).first
      halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
      company_id = company.id
  
      jobs = Job.where(company_id: company_id)
      halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
      collection_to_api(jobs)
    end

    post '/job' do
      job = Job.new(request.params)
      halt(422, { message:'Unprocessible Entity', status: 422, params: request.params}.to_json) unless job
      puts "json_params = ", request.params.to_json
      if job.save
        status 200
        job.to_json
      else
        raise StandardError.new("In POST '/geeks' - Unprocessible Entity 422")
      end
    end

    delete '/job/:id' do
      job = Job.where(id: params[:id]).first
      halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
      puts "job id = #{job.id.inspect} "
      if job.delete
        status 204
        puts "Status = #{status} = deleted"
      else
        raise StandardError.new("In DELETE '/job/:id' - Unprocessible Entity 422")
      end
    end
  end
  
  