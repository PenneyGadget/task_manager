class TaskManagerApp < Sinatra::Base

  # order matters!

  get '/' do
    erb :dashboard
  end

  # read (all)
  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  # create (first half)
  get '/tasks/new' do
    erb :new
  end

  # create (second half) - route hit when 'submit' is hit
  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  # read (one specific)
  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  # update
  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  # update
  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
    erb :error
  end
end
