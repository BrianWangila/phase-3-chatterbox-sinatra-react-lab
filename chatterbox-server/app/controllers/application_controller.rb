class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/' do 
    Message.all.to_json
  end
  
  get '/messages' do
    message = Message.all.order(created_at: :ASC)  
    message.to_json
  end

  post '/messages' do
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.delete
    #message.destroy
    message.to_json
  end
end
