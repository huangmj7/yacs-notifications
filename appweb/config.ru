# Default Rack interface

# load the application
load ::File.expand_path(File.join('..', 'appweb.rb'), __FILE__)

Iodine::DEFAULT_HTTP_ARGS[:public] = './public'

run Plezi.app
