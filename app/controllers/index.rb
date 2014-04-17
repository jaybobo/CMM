enable :sessions

get '/' do
  if logged_in?
	  erb :"users/index" 
	else 
		erb :index
	end
end


