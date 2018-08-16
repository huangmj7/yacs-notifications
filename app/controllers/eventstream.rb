require 'plezi'
require 'iodine'

class EventStream
  #@auto_dispatch = true
  def index
    render 'client'
  end 

  def on_open
    subscribe channel: "WS"
    publish channel:"WS",message:"WS connection open"
    ::Iodine.subscribe(channel:"notifications")  {|ch,msg| publish channel:"WS",message:"#{ch}:: #{msg} \n"} #This method can recevie message from Iodine but not what we want, may related to PID.
    #::Iodine.subscribe(channel:"notifications")  do 
      #publish channel:"notifications",message:"In coming"
    #end #Bryan's version
  end
  
  #TODO
  def on_message data
    Iodine::publish channel:"notifications",message:"Message from forntend: #{data}"
    #publish channel:"WS",message:"Message from forntend: #{data}"
  end 

  def on_close
    publish channel:"notifications",message:"WS connection close"
    #::Iodine::unsubscribe channel:"notifications" #TypeError: expect Fixnums

  end 
end
#test location: ws://localhost:3000/notifications/
# ws://localhost:4860
