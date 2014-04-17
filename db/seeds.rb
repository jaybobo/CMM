FILE1 = "db/t_reporting_client_summary_dummydata.txt" #shorter file
FILE2 = "db/t_reporting_dummydata.txt"


def parser_one(filename)
	holder = []

	File.open(filename, "r").each do |row|
		holder << array_of_strings = row.split('|').map(&:chomp)
		
	end
	holder
end


def strip_each_array(array)
	array.each do |inner_array|
		inner_array.map do |i|
			i.gsub!(/^\"|\"?$/, '')
		end
	end
end

HEADERS = [:user_city, :user_state, :user_msa, :user_type, :request_id, :request_time, :form_name, :drug_name, :month_part, :territory, :district_number]

def zipped(headers, cleaned_data)
	cleaned_data.inject(Array.new) do |memo, array|
		memo << headers.zip(array)
	end
end


def change_arrays_to_hashes(array_of_arrays)
	array_of_arrays.map do |array|
		Hash[array]
	end
end

one = parser_one(FILE2)

cleaned_data =  strip_each_array(one[1..-1]) 

key_value_array = zipped(HEADERS, cleaned_data)

hashes = change_arrays_to_hashes(key_value_array)

hashes.each do |hash|
	Request.create!(hash)
end
