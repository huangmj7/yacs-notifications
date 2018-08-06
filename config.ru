# Default Rack interface

# load the application
load ::File.expand_path(File.join('..', 'notifications.rb'), __FILE__)

Iodine::DEFAULT_HTTP_ARGS[:public] ||= './public'

<<<<<<< HEAD

#run App
#run Plezi.app
=======
# run Plezi.app
>>>>>>> 3e679419c4a3072f794fa893c2c903334ba24107
