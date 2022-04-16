
#set up variables

require 'telegram_bot'
token = ENV["API_KEY"]
bot = TelegramBot.new(token: token)

#Bot loop

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Hey - I am new, I cannot do much yet ... Try the /greet command."
    when /greet/i
      reply.text = "🇵🇹 👋 Hello World, Boa Tarde, #{message.from.first_name}. Greetings from Portugal🇵🇹"
    else
      reply.text = "Unknown Command: #{command.inspect}"
    end
    puts "LOG: #{reply.text.inspect} sent to #{message.from.first_name}"
    reply.send_with(bot)
  end
end
