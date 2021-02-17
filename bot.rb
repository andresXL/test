require 'telegram_bot'

token = '1633787457:AAFt71oByi51oA2roxUCxmzT6HD16aQ-ZuQ'

bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)
  
    message.reply do |reply|
      case command
      when /seeker/i
        reply.text = "seeker command."
      when /keeper/i
        reply.text = "normal keeper command"
      when /beater/i
        reply.text = "beater command\nprueba"
      when /hardbtr/
        beats = ["hard beater command\nandres", "hard beater command\nsainz", "hard beater command\nalvarez"]
        reply.text = "#{beats.sample}"
      else
        reply.text = "idk what you mean :("
      end
      puts "sending #{reply.text.inspect} to @#{message.from.username}"
      reply.send_with(bot)
    end
  end