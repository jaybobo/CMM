def logged_in?
	!current_user.nil?
end

def current_user
	if session[:user_id]
		@user ||= User.find(session[:user_id])
	end
end


#returns a number
def count_by_user_and_month_part(col_type, date) 
	Request.where(user_type: col_type, month_part: date).count
end

def total_count_by_date(date)
	Request.where(month_part: date).count
end

def total_count_by_user_type(type)
	Request.where(user_type: type).count
end


def prepare_line_chart_data(months, type)
	count = 6
	values = months.map do |month|
		{:x => count+=1, :y => count_by_user_and_month_part(type, month)}
	end
	values
end


def prepare_bar_chart_data(months, key)
	values = months.map do |month|
		{:label => month, :value => total_count_by_date(month)} 
	end	
	values
end

#YTD totals for inital report pie chart
def total_requests_YTD(key)
  [{:key => key, :value => total_count_by_user_type(key)}]
end



#Needed Queries for Summary#
#@total_requests_YTD_by_pharm = total_requests_YTD("Pharmacy")
#@total_requests_YTD_by_phys = total_requests_YTD("Physician")


	# @total_pharmacy_requests_ytd = total_count_by_user_type("Pharmacy")
	# @total_physician_requests_ytd = total_count_by_user_type("Physician")
# 
	# @total_physician_requests_aug = find_count_by_date_and_user_type("Physician","2013-08-01")