enable :sessions

get '/' do
 #  if logged_in?
	#   erb :"users/index" 
	# else 
		erb :index
	# end  
end

# ---------- TESTING ----------

get '/dashboard' do
  erb :'dashboard'
end

get '/log_in' do 
  erb :log_in
end

get '/reports' do
  erb :report
end

get '/training' do 
  erb :training
end

get '/outreach' do
  erb :outreach
end

get '/help' do
  erb :help
end
