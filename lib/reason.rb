require 'telegram/bot'
require 'net/http'
require 'json'

class Reason
  attr_reader :img

  @values = nil
  def initialize
    @values = chuck_json
    @img = 'https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png'
  end

  def select_value
    @values.slice('value')
  end

  private

  def chuck_json
    url = 'https://api.chucknorris.io/jokes/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
