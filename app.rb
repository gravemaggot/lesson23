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

    @username  = params[:username];
    @phone     = params[:phone];
	@datetime  = params[:datetime];
    @master    = params[:master];
    @color     = params[:color];

    @title     = 'Thanks you!';
    @message   = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}. Master: #{@master}. Color: #{@color}";

    # Проверка заполнения
    errPattern = {
        :username   => 'Введите имя',
        :phone      => 'Укажите телефон',
        :datetime   => 'Не правильная дата визита'
    };

    errPattern.each do |key, value|
        if params[key] == ''
            @error = value
        end
    end;

    if @error != '' 
        return erb(:visit)
    end;

    # Запись в файл
	f = File.open('./public/users.txt', 'a');
    f.write("User: #{@username}, Phone: #{@phone}, Date and Time: #{@datetime}, Master: #{@master}, Color: #{@color}\n");
    f.close();

    # Вывод сообщения об ошибке
    erb(:message)

end