enable :sessions

#user-dashboard
get '/users' do
	if logged_in?
		erb :"users/index" 
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
	@user = User.find_by(email: params[:email])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		erb :"users/index" 
	else
		redirect to "/"
	end
end

#sign up page
post '/session/new' do
	p params[:user]
	@user = User.new(params[:user])

	if @user.save
		session[:user_id] = @user.id
		erb :"users/index" 
	else
		redirect to "/"
	end
end