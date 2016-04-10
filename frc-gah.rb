require 'sinatra'
require_relative 'thebluealliance-ruby/api.rb'
require 'date'

before do
  @tba = TBA_API.new('brycematsuda', 'frc-gah', '0.0.0')
end

get '/' do
  erb :index
end

get '/event/:event_key' do
  begin
    erb :event, :locals => { :matches => @tba.get_event_matches(params['event_key']).sort_by { |k| k['time'] }}    
  rescue Net::HTTPServerException => e
    "Invalid event key."
  end
end

get '/match/:match_key' do
  begin
    match_alliances = @tba.get_match(params['match_key'])['alliances']
    red_alliance = match_alliances['red']['teams']
    blue_alliance = match_alliances['blue']['teams']

    erb :match, :locals => 
    { :red_alliance => get_alliance_data(red_alliance), 
      :blue_alliance => get_alliance_data(blue_alliance)
    }    
  rescue Net::HTTPServerException => e
    "Invalid match key."
  end
end

get '*' do
	erb :index
end

helpers do
  def get_alliance_data(alliance)
    alliance_data = []
    alliance.each do |team_key|
      team_data = @tba.get_team(team_key)
      team_awards = @tba.get_team_history_awards(team_key).select {|award| award['year'] == Date.today.year}
      awards_data = []
      team_awards.each do |award|
        awards_data.push(award['year'].to_s + " " + @tba.get_event(award['event_key'])['name'] + " " + award['name'])
      end
      team_data['awards'] = awards_data
      alliance_data.push(team_data)
    end

    return alliance_data
  end
end
