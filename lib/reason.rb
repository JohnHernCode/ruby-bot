require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Reason
  @values = nil

  def initialize
    @values = chuck_json
  end

  def chuck_json
    url = 'https://api.chucknorris.io/jokes/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def select_value
    @values = @values.slice('value')
    @values
  end
end
