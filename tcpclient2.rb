require 'socket'

client = TCPSocket.new("localhost", 20000)

  #client.puts("need connection")

Thread.new do
  loop do
    r = gets.chomp
    puts "lei #{r}, voy a mandarlo al servidor"
    client.puts(r)
  end
end

Thread.new do 
  loop do 
     s = client.gets
     puts "El servidor dijo #{s}"
  end
end

loop do
end
