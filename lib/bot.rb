# rubocop:disable Metrics/LineLength

require 'telegram/bot'
require_relative 'reason'
require 'dotenv'
Dotenv.load('token.env')

class Bot
  def initialize
    @values = Reason.new
    token = '1564003055:AAGjwAuEyQAwoLt3KzIGVBnj-bjiT7x8YGc'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to the bot that tells you how much Chuck Norris Rocks.")
          bot.api.send_message(chat_id: message.chat.id, text: 'When ready, you can use these commands for Chuck Norris info.')
          bot.api.send_message(chat_id: message.chat.id, text: "/start = Start Bot \n/stop = End Bot \n/chuck_rocks = A good reason why Chuck Norris Rocks")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Remember, Chuck loves you #{message.from.first_name}", date: message.date)
        when '/chuck_rocks'
          value = @values.select_value
          bot.api.send_photo(chat_id: message.chat.id, photo: @values.img, date: message.date)
          bot.api.send_message(chat_id: message.chat.id, text: (value['value']).to_s, date: message.date)
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name},\nuse  /start,  /stop , or /chuck_rocks")
        end
      end
    end
  end
  # rubocop:enable Metrics/LineLength
end
