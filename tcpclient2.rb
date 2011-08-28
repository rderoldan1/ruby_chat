require 'socket'

puts "ip address"
ip = gets
if ip =~ /localhost/
	ip='127.0.0.1' 
end

client = TCPSocket.new(ip, 20000)
  #client.puts("need connection")

Thread.new do
  loop do
    r = gets.chomp
   # puts "lei #{r}, voy a mandarlo al servidor"
    client.puts(r)
  end
end

Thread.new do 
  loop do 
	
     	s = client.gets.chomp
	
  	 #puts "El servidor dijo #{s}"
	puts "#{s}"
 	#break if s =~ /Clossing the connection/
  end
end

loop do
end
