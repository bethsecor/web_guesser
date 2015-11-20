require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_result(guess)
  guess = guess.to_i
  difference = guess - SECRET_NUMBER
  if difference > 5
    "Way too high!"
  elsif difference > 0
    "Too high!"
  elsif difference < -5
    "Way too low!"
  elsif difference < 0
    "Too low!"
  else
    "The SECRET NUMBER is #{SECRET_NUMBER}."
  end
end

get '/' do
  guess = params["guess"]
  result = check_result(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER,
                          :result => result}
end
