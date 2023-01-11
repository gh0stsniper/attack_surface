require 'httparty'

file = ARGV[0]

puts file

$list = []

if !File.exist?("result.txt") then

	f = File.open("results.txt", "w")
	f.close

	

end

def read_subdomain(file)

	File.readlines(file).each do |subdomain|

		subdomain = subdomain.chomp("\n")

		$list << subdomain

	end

end

def live_domain(list)

	protocol = "https://"
	
	$list.each do |sub|
	

	begin 

		valid_url = protocol + sub
		# valid_url
		#puts(valid_url)
		#uri = URI(valid_url)


		#case HTTPX.head(valid_url) in 

		#{HTTPX.status: 200..399 => status}
		#timeout(2)
	  	#puts status

	  	#in {HTTPX.error: error}

	  	#warn error


	  	res = HTTParty.get(valid_url)

	  	if res in 200..399 then 

		puts valid_url
	  	f = File.open('results.txt','a')
		File.write('results.txt', valid_url,mode: 'a+')

		end
		
		

	rescue 

		#puts("#{valid_url} is not accessible")

		

	
		#puts valid_url


	

		

	end

	
end

end

		






# call the functions

read_subdomain(file)

live_domain($list)
