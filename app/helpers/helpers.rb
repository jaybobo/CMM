def logged_in?
	!current_user.nil?
end

def current_user
	if session[:user_id]
		@user ||= User.find(session[:user_id])
	end
end


#returns a number
def count_by_date_and_user_type(col_type, date) 
	Request.where(user_type: col_type, month_part: date).count
end

def total_count_by_date(date)
	Request.where(month_part: date).count
end

def total_count_by_user_type(type)
	Request.where(user_type: type).count
end



def prepare_bar_chart_data(months, key)
	values = months.map do |month|
		{:label => month, :value => total_count_by_date(month)} 
	end
	#[{:key => key, :values => values, :length => values.length}]	
	values
end



#Needed Queries for Summary#
	# @total_pharmacy_requests_ytd = total_count_by_user_type("Pharmacy")
	# @total_physician_requests_ytd = total_count_by_user_type("Physician")
# 
	# @total_physician_requests_aug = find_count_by_date_and_user_type("Physician","2013-08-01")