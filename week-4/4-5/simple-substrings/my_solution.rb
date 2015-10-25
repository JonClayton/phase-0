# Simple Substrings

# I worked on this challenge by myself.


# Your Solution Below
def welcome(address)
	method = 3
	case method
	when 1
		length = address.length
		index = 0
		while index < length 
			test = true if address[index,2] == "CA"
			index += 1
		end
		return test ? "Welcome to California" : "You should move to California"
	when 2
		return address.include?("CA") ? "Welcome to California" : "You should move to California"
	when 3
		return address["CA"] ? "Welcome to California" : "You should move to California"
	end
end