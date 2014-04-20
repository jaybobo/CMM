# enable :sessions

get '/' do
  if logged_in?
	  erb :"users/dashboard" 
	else 
		erb :index
	end  
end

