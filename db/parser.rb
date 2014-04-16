require 'csv'

FILE1 = "t_reporting_client_summary_dummydata.txt" #shorter file
FILE2 = "t_reporting_dummydata.txt"


def parser_one(filename)
	holder = []

	File.open(filename, "r").each do |row|
		holder << array_of_strings = row.split('|').map(&:chomp)
		
	end
	holder
end

def strip_header_strings(array_of_strings)
	array_of_strings.map do |el|
		el.gsub!(/^\"|\"?$/, '')
	end
end

# def transform_remaining_double_strings(array_of_strings)
# 	array_of_strings.each do |array|
# 		array.map do |el|
# 			if el == array[1] || el == array[2]
# 				el.gsub!(/^\"|\"?$/, '')
# 			else
# 				el
# 			end
# 		end
# 	end
# end

def strip_each_array(array)
	array.each do |inner_array|
		inner_array.map do |i|
			i.gsub!(/^\"|\"?$/, '')
		end
	end
end

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

headers = strip_header_strings(one[0])

cleaned_data =  strip_each_array(one[1..-1].pop(5)) 

key_value_array = zipped(headers, cleaned_data)

change_arrays_to_hashes(key_value_array).each do |hash|
	Request.new(hash)
end

#ALL STRINGS CLEANED, READY TO BE ZIPPED TO HEADERS!

# p strip_header_strings(one[0]) #headers alone
#p transform_remaining_double_strings(one[1..-1].pop(5)) #rest of data, 

