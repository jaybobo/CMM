# enable :sessions

get '/' do
  if logged_in?
    redirect '/dashboard' 
	else 
		erb :index
	end  
end

get '/dashboard' do
  if logged_in?
    erb :"users/dashboard"
  else
    redirect '/'
  end
end