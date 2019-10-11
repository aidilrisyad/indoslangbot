require 'telegram_bot'
token = '838475009:AAG4BAyygzf2TluXPhd8YCbKBITCC_xXx1M'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    a =  csv.find {|row| row['slang'] == command}
	puts "halo, #{a['slang']} artinya adalah #{a['baku'], contohnya"
	
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
