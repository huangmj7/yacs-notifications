require 'karafka'
require 'plezi'
require 'iodine'
require_relative 'application_consumer'

class SectionConsumer < ApplicationConsumer
  def consume
    puts params
    @notifications = "No incoming message"
    #unless params.nil? 
      #@notifications = params.to_s
    #end
    #::Iodine::publish channel: "notifications", message: "Hi, I am a catfish"
    #::Iodine::publish("notifications","Hi, I am a catfish")
    puts "Finish, Bye"
  end
end
