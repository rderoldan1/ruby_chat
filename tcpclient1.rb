require "socket" 

PORT = 20000


chat_client = TCPSocket.new("localhost", PORT) 

#while line = gets do chat_client.puts(line) end
loop do
line = gets       
chat_client.puts(line)
str = chat_client.recv( 100 ) 
puts str
end
