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
