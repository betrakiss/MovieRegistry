get '/' do
  redirect '/login'
end

get '/index' do
  erb :'home/index', :locals => {
    :username     => cookies[:username],
    :latest       => Movies::Registry.new(cookies[:username]).latest,
    :new_episodes => Movies::Registry.new(cookies[:username]).check_for_new
  }
end

post '/query' do
  query = MovieDb::ImdbManager.get_by_name(params[:movie_name])
  erb :'home/query', :locals => { :movies => query.movies.take(15) }
end
