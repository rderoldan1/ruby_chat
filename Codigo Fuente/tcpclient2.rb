require 'socket'

puts "ip address"
ip = gets.chomp
puts "port"
port = gets.chomp
	if ip =~ /localhost/
		ip='127.0.0.1' 
	end 

	if port =~ /default/
		port = 20000
	else
		port = port.to_i
         end


@n = 0

puts "type help in order to know the commands."
client = TCPSocket.new(ip, port)
  #client.puts("need connection")

	Thread.new do
		  loop do
			    r = gets.chomp
			    client.puts(r)
		  end
	end

	Thread.new do 
		  loop do 
			  s = client.gets.chomp
	        	  puts "#{s}"
	           		  if s=~ /Closing/
					@n= 1
				  end
		  end
	end

while @n.eql? 0
end
#loop do
#end
