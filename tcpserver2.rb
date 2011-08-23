require 'socket'

server = TCPServer.new(20000)
client = []

loop do 
	Thread.start(server.accept) do |connection|
		client << connection	
		connection.write ("Welcome, you're connected /n please write a message")
		while line = connection.gets
			break if line =~ /quit/
			puts line
			connection.write ("Received")
		end
		
		connection.write ("Closing the connection")
		connection.close
		end
	end
