enable :sessions

#user-dashboard
get '/users' do
	if logged_in?
		erb :"users/dashboard" 
	else
		erb :index
	end
end

#logout
get '/users/logout' do
	session.clear
	redirect to "/"
end

#authenticate on login page
post '/users/login' do
	p session
	p params
	@user = User.find_by(email: params[:email])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		erb :"users/dashboard" 
	else
		redirect to "/"
	end
end

#sign up page
post '/session/new' do
	p session
	p params
	@user = User.new(params[:user])
	p @user
	if @user.save
		session[:user_id] = @user.id
		erb :"users/dashboard" 
	else
		redirect to "/"
	end
end