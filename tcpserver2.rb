require 'socket'

class Server
	 server = TCPServer.new(20000)
        @client = {}

        puts "Waiting a connection"
	
	loop do 
		Thread.start(server.accept) do |connection|
			connection.puts ("Welcome, you're connected, please write your name")
			i = 0
		      while i.eql? 0		
				n = connection.gets
					if @client.include? n
						connection.puts "This name is already taken, please choose another one"
					else		        
						 @client [n] = connection
						i = 1
					end#if
			end#else
		
			@client.each do |name, sock|
	                	if  sock.eql? connection
					puts "- #{n} is online"
				else
					lin = "Server info: #{n} is online!"
					sock.puts  (lin)
				end#if	
			end#each

			connection.puts "You are connected.\n Now you can send public  messages."
			while line = connection.gets
			        break if line =~ /quit/
					if line =~  /help/
						connection.puts "list: show the online users\nquit: leave of the chat .\nprivate: send a message to some user.\nIf you like to send a message to everybody, only you should write the."
					elsif line =~ /list/
						@client.each do |user, sock|
							connection.puts user
						end#each
							elsif line =~ /private/ 
					  			connection.puts "Write the destination user name"
								line = connection.gets
								@client.each do |name, sock|
								j = 0								
									while j.eql? 0														
										if @client.include? line
											if name.eql? line
												connection.puts "Write the message"
												message = connection.gets
												sock.puts ("Private message from #{n} says : #{message}")
												j=1
											end#if
										else
											connection.puts "This user doesn't exits, like you write to another user. tipe y/n"
											line = connection.gets
											if line =~ /y/
												j=0
												connection.puts "Write the destination user name"
												line = connection.gets
												else
												j=1
												connection.puts "Write your public messages"
											end#if
										end#if
									end #while
								end#each
						else
							puts line
							@client.each do |name, conn|
					                	if  conn.eql? connection 
									puts "-#{n} says #{line}"
								else
									puts name, conn
									conn.puts ("Message from #{n} says #{line}")
								end#if					
						           end#each
						end#else					
				end #while
			

				@client.each do |name, sock|
					if  sock.eql? connection
						@client.each do |otherUser, otherSock|
							if otherSock.eql? sock
								puts "- #{name}is offline"
								@client.delete (name)					
							else
								lin = " Server info: #{name} is offline!"
								otherSock.puts (lin)
							end#if	
						end#each
					end#if
	end#do
	
			connection.puts ("Closing the connection")
			connection.close
			@client.delete(connection)

		end#Thread
	end#loop

end#server


