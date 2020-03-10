#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello, Vovanus! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do

    @user_name = params[:username]
    @phone     = params[:phone]
	@date_time = params[:datetime]
	@master    = params[:master]

    @title     = 'Thanks you!'
    @message   = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}. Master: #{@master}"

	f = File.open('./public/users.txt', 'a')
    f.write("User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time}. Master: #{@master}\n")
    f.close()

    erb(:message)

end