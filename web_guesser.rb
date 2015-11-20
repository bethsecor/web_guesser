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

def add_cheat?(cheat)
  if cheat == "true"
    " The SECRET NUMBER is #{SECRET_NUMBER}."
  else
    ""
  end
end

get '/' do
  guess = params["guess"]
  cheat = params.fetch("cheat", "false")
  result = check_result(guess)
  message = result + add_cheat?(cheat)
  erb :index, :locals => {:secret_number => SECRET_NUMBER,
                          :result => result, :message => message}
end
