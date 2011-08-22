require "socket" 
require "thread" 

PORT = 20000

chat_server = TCPServer.new("localhost", PORT) #crea el socket

chat_clients = [] #arreglo de clientes

loop do 
        Thread.new(chat_server.accept) do |chat_client| 
                chat_clients << chat_client #guarda el cliente 

                while line = chat_client.gets.strip 
                        puts "[#{Time.now}]"  
   			chat_client.write ("respondo")#envia al cliente que escribio
                        puts line #imprime mnj entrante
			number = chat_clients.count
			puts number
			puts chat_clients
            end    
        end 
end
