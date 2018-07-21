require "observer"
require 'plezi' 


class Massager
  def initialize
   puts "Activated"
  end
  def self.update(consumer)
    puts "Receive changes!"
    puts  consumer
  end
end






