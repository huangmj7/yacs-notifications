require 'karafka'
require 'iodine'
require_relative 'application_consumer'

class CourseConsumer < ApplicationConsumer
  def consume
  # EventStream.new.notify(params)
  # puts "Consumer message sent to websocket"	
  	puts params
  end
end
