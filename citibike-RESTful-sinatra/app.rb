DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/source/stations.db")

module Citibike
  class App < Sinatra::Application 
  
  # before do
  #   json = File.open("data/citibikenyc.json").read
  #   @data = MultiJson.load(json)
  # end

  # get '/stations' do
  #   @station = Station.all
  #   erb :index
  # end

  # get '/stations/new' do
  #   @station = Station.new
  #   erb :new
  # end

  # post '/stations' do
  # @station = Station.new(params[:station])
  # if @station.save
  #   redirect '/stations/' + @station.id.to_s
  # else
  #   status 404
  #   erb :new
  #   end
  # end

  # get '/stations/edit/:id' do
  #   @station = Station.get(params[:id])
  #   erb :edit
  # end

  # put '/stations/:idx' do
  #   @station = Station.get(params[:id])
  #   if @station.update(params[:station])
  #     redirect '/stations/' + params[:id]
  #   else
  #     status 400
  #     erb :edit
  #   end
  # end

  # get '/stations/delete/:id' do 
  #   @station = Station.get(params[:id])
  #   erb :delete
  # end

  # delete '/stations/:id' do
  #   Station.get(params[:id]).destroy
  #   redirect '/stations'
  # end

  # get '/stations/:id' do
  #   @station = Station.get(params[:id])
  #   erb :show
  # end

  helpers do
    def partial(view)
      erb view, :layout => false
    end
  end

  DataMapper.auto_upgrade!

  end

end