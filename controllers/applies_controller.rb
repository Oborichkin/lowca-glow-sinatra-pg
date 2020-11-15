namespace '/api/v1' do

    get '/applies' do
      applies = Apply.all
      [:job_id, :geek_id].each do |filter|
        applies = applies.send(filter, params[filter]) if params[filter]
      end
      collection_to_api(applies)
    end
  
    get '/applies_read' do
      collection_to_api(Apply.read)
    end
  
    get '/applies_unread' do
      collection_to_api(Apply.unread)
    end

  end