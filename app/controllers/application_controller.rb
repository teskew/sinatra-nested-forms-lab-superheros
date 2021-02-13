require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
      end
  
  
    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        members = params[:team][:members]
  
           members.each do |member_params|
          SuperHero.new({name: member_params[:name], power: member_params[:power], bio: member_params[:bio]})
           end
        @super_heroes = SuperHero.all
  
        erb :team
      end
  end	

  
  #or can write it the post this way
  #@team = Team.new(params[:team])
  #params[:team][:members].each do |member_params|
  #  SuperHero.new(member_params)
  #end
  #@super_heroes = SuperHero.all


