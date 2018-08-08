require 'karafka'
require 'iodine'
require_relative 'application_consumer'

class CourseConsumer < ApplicationConsumer
  def consume
    unless params.nil?
	    @notifications = params.to_s
      ::Iodine::publish channel: "notifications", message: "#{@notifications}"
      puts "CourseConsumer sent message to websocket"
    end	
  end
end
