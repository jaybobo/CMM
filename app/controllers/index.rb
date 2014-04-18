enable :sessions

get '/' do
 #  if logged_in?
	#   erb :"users/index" 
	# else 
		erb :index
	# end  
end

# ---------- TESTING ----------

get '/user' do

  erb :'users/index'
end

get '/login' do 
  erb :log_in
end

