require 'karafka'
require_relative 'application_consumer'

class CourseConsumer < ApplicationConsumer
	def consume
	  puts '' #print out the single message received

	end
end

