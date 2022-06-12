require_relative 'enigma'
require_relative 'encryption'

message = File.open(ARGV[0], 'r')#opens file class

incoming_text = message.read #gives access to the message contents

message.close #memory management, get what you need, close it

enigma = Enigma.new
enigma.message = incoming_text.strip#removes trailing \n
enigma.key = ARGV[2]
enigma.date = ARGV[3]
unaltered_text = enigma.encrypt(enigma.message, enigma.key, enigma.date)

writer = File.open(ARGV[1], 'w')

writer.write(unaltered_text)#could be instance of class file, .write instance of class file

writer.close #memory management

reader = File.open(ARGV[1], 'r')

output_text = reader.read

reader.close

output_date = output_text[-7..-1][0..-3]
output_key = output_text[-30..-1][0..-20][-5..-1]


time = Time.now.strftime("%d/%m/%Y %H:%M")

puts "Created #{ARGV[1]} at #{time} with the key #{output_key} and the date #{output_date}."
