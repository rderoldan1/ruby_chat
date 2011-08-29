require 'socket'

puts "ip address"
ip = gets
puts "port"
port = gets
	if ip =~ /lh/
		ip='127.0.0.1' 
	end 

	if port =~ /df/
		port = 20000
	else
		port = port.to_i
         end


@n = 0


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
