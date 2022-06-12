require_relative 'enigma'
require_relative 'decryption'

message = File.open(ARGV[0], 'r')#opens file class

incoming_text = message.read #gives access to the message contents

message.close #memory management, get what you need, close it

output_date = incoming_text[-7..-1][0..-3]
output_key = incoming_text[-30..-1][0..-20][-5..-1]
output_message = incoming_text[0..-35]
output_message.slice! "{:encryption=>\""

enigma = Enigma.new
enigma.message = output_message
enigma.key = output_key
enigma.date = output_date
unaltered_text = enigma.decrypt(enigma.message, enigma.key, enigma.date)

writer = File.open(ARGV[1], 'w')

writer.write(unaltered_text)#could be instance of class file, .write instance of class file

writer.close #memory management

time = Time.now.strftime("%d/%m/%Y %H:%M")

puts "Created #{ARGV[1]} at #{time} with the key #{output_key} and the date #{output_date}."
