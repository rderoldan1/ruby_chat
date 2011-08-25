require 'socket'

class Server

server = TCPServer.new(20000)
@client = {}

 #   def run
	loop do 
		Thread.start(server.accept) do |connection|
#		@client[] << connection	
			connection.puts ("Welcome, you're connected, please write your name")
			n = connection.gets
		        @client [n] = connection
			puts n 

				while line = connection.gets
				break if line =~ /quit/
				puts line
				connection.puts ("Received")
					@client.each do |name, conn|
			                	if  conn.eql? connection
						puts "is the same user"
						else
						puts name, conn
						conn.puts (line)
						end					
				end
			
			end #while
		
			connection.write ("Closing the connection")
			connection.close
		end#Thread
	end#loop
#   end#run

end

#serv = Server.new()
#serv.run


