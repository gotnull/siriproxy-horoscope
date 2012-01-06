require 'cora'
require 'siri_objects'
require 'json'
require 'httparty'
	
class SiriProxy::Plugin::Horoscope < SiriProxy::Plugin

	class Horoscope

		def initialize(sign, horoscope)
			# Instance variables
			@sign = sign
			@horoscope = horoscope
		end
		
		def show_sign
			return @sign
		end

		def show_horoscope
			return @horoscope
		end

	end  
	
	def initialize(config = {})
	end

	def get_horoscope(sign)

		uri = "http://widgets.fabulously40.com/horoscope.json?sign=#{sign}"
		
		page = HTTParty.get(uri).body
		show_info = JSON.parse(page)
		
		horoscope = nil
		
		unless show_info.nil?
			horoscope_message = "#{show_info['horoscope']['horoscope']}."
			horoscope_sign = show_info['horoscope']['sign']
			
			horoscope = Horoscope.new(horoscope_sign, horoscope_message)
		end
		
		return horoscope

	end

	# Example: "Siri, give me the horoscope for Pisces."
	listen_for /horoscope for (.+)/i do |sign|

		say "Here's your horoscope:"

		Thread.new {
			
			horoscope = get_horoscope(sign.downcase)
			
			say "#{horoscope.show_sign}: #{horoscope.show_horoscope}"
		
			request_completed
		}

	end

end
