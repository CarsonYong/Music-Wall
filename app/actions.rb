# Homepage (Root path)
get '/' do
  erb :index
end


# get '/musicwall' do
#   'Music List here'
# end

get '/musicwall' do
  @songs = Song.all
  erb :'musicwall/index'
end

get '/musicwall/new' do
  erb :'musicwall/new'
end

post '/musicwall' do
  @songs = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url:  params[:url]
  )
  @songs.save
  redirect '/musicwall'
end