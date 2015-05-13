require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'dev.db'
)

ActiveRecord::Base.default_timezone= :local

class Article < ActiveRecord::Base
end

get '/' do 
	@article = Article.order("created_at ASC")
	@title = "Article"	
	erb :index
end

post '/' do
	@article = Article.new(params[:articles])
	@article.save
	redirect '/'
end

