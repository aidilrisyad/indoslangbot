require 'csv'
require 'telegram_bot'
token = '838475009:AAG4BAyygzf2TluXPhd8YCbKBITCC_xXx1M'
bot = TelegramBot.new(token: token)

csv = CSV.read('colloquial-indonesian-lexicon.csv', :headers=>true)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  commandb = message.get_command_for(bot)
  message.reply do |reply|
  
  command = commandb.downcase
  if command == 'start'
    reply.text = "Selamat datang di Indonesia Slang Bot, silahkan ketik kata yang tidak anda mengerti\n\n contohnya : skrg, bgt, kk, gw, yg dan lain lainnya\n\n atau ketik : tentang\n untuk mencari tahu tentang kami "
  elsif csv.find {|row| row['slang'] == command}
    a = csv.find {|row| row['slang'] == command}
    reply.text = "untuk kata #{a['slang']} artinya adalah #{a['baku']}, contohnya adalah\n\n  #{a['konteks']}}"
  elsif command == 'tentang'
    reply.text = "aplikasi Indonesian Slang Bot merupakan chatbot yang dapat mengartikan kata-kata slang yang ada di indonesia menjadi kata biasa, aplikasi ini dibuat oleh Amirotun Nafiah, Balqis R. Chasanah, Lugina Suciati Putri, Muhammad Aidil Risyad"
  elsif command == 'terima kasih'
    reply.text = "Sama sama ya"
  elsif command == 'cukup'
    reply.text = "baik, sampai ketemu lagi"
  else
    reply.text = "maaf, tapi saat ini bot belum mengerti kata #{command.inspect}\n silahkan cari kata yang lain ya "
  end
  puts "sending #{reply.text.inspect} to @#{message.from.username}"
  reply.send_with(bot)
end
end