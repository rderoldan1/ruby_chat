require 'socket'

client = TCPSocket.new("localhost", 20000)

while line = gets
	client.write(line)
        msj = client.recv( 100 )
	puts msj
 end
