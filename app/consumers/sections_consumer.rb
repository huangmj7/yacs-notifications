require 'karafka'
require 'observer'
require_relative 'application_consumer'
require_relative 'temp_observer.rb'


class SectionConsumer < ApplicationConsumer
 
  def consume
  Massager.update(params) #Pass to the massage
  
  end
  
  
end



