
#get all requests
get '/requests' do

	months = ["2013-07-01","2013-08-01","2013-09-01","2013-10-01","2013-11-01","2013-12-01"]
	
	@physician_values = prepare_line_chart_data(months, "Physician")
	@pharm_values = prepare_line_chart_data(months, "Pharmacy")
	@bar_chart_data = prepare_bar_chart_data(months, "Total Requests")



	erb :"requests/index"
end


#display single request
get '/requests/:id' do
end

