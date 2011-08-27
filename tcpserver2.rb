require 'socket'

class Server
	 server = TCPServer.new(20000)
        @client = {}

	loop do 
		Thread.start(server.accept) do |connection|
			connection.puts ("Welcome, you're connected, please write your name")
			n = connection.gets
		         @client [n] = connection
				@client.each do |name, sock|
			                	if  sock.eql? connection
						puts "is the same user 1"
						else
						lin = " #{n} is online!"
						sock.puts  (lin)
						end#if	
				end#each
						puts n 

				while line = connection.gets

				        break if line =~ /quit/
					

					if line =~ /list/
						@client.each do |user, sock|
						puts "entro list"
						connection.puts user
						end
					end
					
				
				puts line
				connection.puts ("Received")
					@client.each do |name, conn|
			                	if  conn.eql? connection 
						puts "is the same user 2"
						else
						puts name, conn
						conn.puts ("#{n} says #{line}")
						end#if					
				           end#each
			
			end #while
			@client.each do |name, sock|
				if  sock.eql? connection
				@client.each do |otherUser, otherSock|
					if otherSock.eql? sock
						puts "is the same user 3"					
					else
						lin = " #{name} is offline!"
						otherSock.puts (lin)
					end#if	
				end#each
				end#if
			end#do
		
			#Decir al user q too bn
			connection.puts ("Closing the connection")
			connection.close
			@client.each
					
			

		end#Thread
	end#loop

end#server


