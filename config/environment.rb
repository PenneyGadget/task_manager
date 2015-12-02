require 'bundler' #bundler is our gem that manages our gem
Bundler.require #command that looks at gemfile and requires code specified in there

#get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

#require the controller(s)
#Dir.glob creates an array of the things you put in it - the same as Dir[]
#take our App root and join together (into a file path) the app, controllers, and any ruby file and require each of them
#".../task_manager/app/controllers/*.rb" --> .glob makes [task_manager, app, controllers, task_manager_app]
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

#require the model(s)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }

#configure the TaskManagerApp settings
#opening up the class here - makes our controller ONLY deal with HTTP stuff instead of settings as well
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end
