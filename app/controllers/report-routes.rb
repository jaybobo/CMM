
#get all requests
get '/reports' do

	months = ["2013-07-01","2013-08-01","2013-09-01","2013-10-01","2013-11-01","2013-12-01"]
	
	#line chart
	@physician_values = prepare_line_chart_data(months, "Physician")
	@pharm_values = prepare_line_chart_data(months, "Pharmacy")

	#bar chart
	@bar_chart_data = prepare_bar_chart_data(months, "Total Requests")

	#pie chart
	@total_requests_YTD_by_phys = total_count_by_user_type("Physician")
	@total_requests_YTD_by_pharm = total_count_by_user_type("Pharmacy")	
	
	#summary table
	@summary_table_data = summary_chart_data("Physician", months).merge(summary_chart_data("Pharmacy", months))
	#Returns a hash

	@summary_table_totals = add_elements_of_two_arrays(@summary_table_data["Physician"],  @summary_table_data["Pharmacy"])


	


	#PHarmacy (PriorAuthPlus, EasyButton, Web)
	#Metric							July, Aug, Sept, Oct, Nov, Dec
	#Total
	#Pharmacy			num, num, num, num, num, num
	#Physician		num, num, num, num, num, num

	erb :"reports/index"
end


#display single request
# get '/requests/:id' do
# end

