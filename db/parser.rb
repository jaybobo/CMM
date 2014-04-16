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

def transform_remaining_double_strings(array_of_strings)
	array_of_strings.each do |array|
		array.map do |el|
			if el == array[1] || el == array[2]
				el.gsub!(/^\"|\"?$/, '')
			else
				el
			end
		end
	end
end




#ALL STRINGS CLEANED, READY TO BE ZIPPED TO HEADERS!
one = parser_one(FILE1)
p strip_header_strings(one[0]) #headers alone
p transform_remaining_double_strings(one[1..-1]) #rest of data, 
