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
	@article = Article.all()
	@title = "Article"	
	erb :index
end

post '/' do
	@article = Article.new(params[:articles])
	@article.save
	redirect '/'
end

delete '/:id' do
	@article = Article.find(params[:id])
	@article.destroy
	redirect '/'
end

get '/:id' do
	@article = Article.find(params[:id])
	@article.save
	erb :edit
end

put '/:id' do
	@article = Article.find(params[:id])
	@article.update_attributes(params[:articles])
	redirect '/'
end

