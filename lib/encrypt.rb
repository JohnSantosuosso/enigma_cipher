message = File.open(ARGV[0], 'r')#opens file class

incoming_text = message.read #gives access to the message contents

message.close #memory management, get what you need, close it

capitalized_text = incoming_text.upcase #where decrypt/encrypt happens?

writer = File.open(ARGV[1], 'w')

writer.write(capitalized_text)#could be instance of class file, .write instance of class file

writer.close #memory management
