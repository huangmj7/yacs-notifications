# Default Rack interface
# load the application
#load ::File.expand_path(File.join('..', 'notifications.rb'), __FILE__)
#Iodine::DEFAULT_HTTP_ARGS[:public] ||= './public'
#run Plezi.app

require 'iodine'
module WebsocketChat
  @client = Iodine::Connection.new()
  def on_open client
    #client.subscribe :chat

    @client = client
    @client.subscribe :chat # Pub/Sub directly to the client (or use a block to process the messages)
    client.write "You're now in the chatroom."     # Writing directly to the socket
  end
  def on_message client, data
    # Strings and symbol channel names are equivalent.#client.publish "chat", data
    @client.publish "chat", data
  end
  def send_message data 
    @client.publish "chat", data
    puts data
  end
  extend self
end
APP = Proc.new do |env|
  if env['rack.upgrade?'.freeze] == :websocket 
    env['rack.upgrade'.freeze] = WebsocketChat 
    [0,{}, []] # It's possible to set cookies for the response.
  elsif env['rack.upgrade?'.freeze] == :sse
    puts "SSE connections can only receive data from the server, the can't write." 
    env['rack.upgrade'.freeze] = WebsocketChat
    [0,{}, []] # It's possible to set cookies for the response.
  else
    [200, {"Content-Length" => "12", "Content-Type" => "text/plain"}, ["Welcome Home"] ]
  end
end
# Pus/Sub can be server oriented as well as connection bound
root_pid = Process.pid
Iodine.subscribe(:chat) {|ch, msg| puts msg if Process.pid == root_pid }
# By default, Pub/Sub performs in process cluster mode.
Iodine.workers = 2
run APP
