require 'socket'

server = TCPServer.new(20000)
client = []

loop do 
	Thread.start(server.accept) do |connection|
		client << connection	
		connection.write ("Welcome, you're connected \n please write a message\n")
		while line = connection.gets
			break if line =~ /quit/
			puts line
			connection.write ("Received\n")
				client.each do |conn|
				puts conn
				conn.puts (line)
				end
		end
		
		connection.write ("Closing the connection")
		connection.close
		end
	end
