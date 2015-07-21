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

get '/musicwall/signup' do
  erb :'musicwall/signup'
end

get '/musicwall/login' do
  erb :'musicwall/login'
end


post '/musicwall' do
  @songs = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url:  params[:url]
    )
  if @songs.save
    redirect '/musicwall'
  else
    erb :'musicwall/new'
  end
end

post '/musicwall/signup' do
  @users = User.new(
    email: params[:email],
    password: params[:password]
  )
  if @users.save
    redirect '/musicwall/login'
  else
    erb :'musicwall/signup'
  end
end

post '/musicwall/login' do
  #@users = params[:email],
  @password = params[:password]
  @users = User.find_by_email params[:email]

  #@user = User.where("email = ? AND passowrd = ?", @users, @password)
  #if @email = params [:email]

    if @users.password == params[:password]
      redirect '/musicwall'
    else
      erb :'musicwall/login'
    end
  #else
   # redirect '/musicwall/signup'
  #end

end


get '/musicwall/:id' do
  @songs = Song.find params[:id]
  erb :'musicwall/show'
end

