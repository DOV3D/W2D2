require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
         @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
       if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}   
    end


    def list_rooms
        @rooms.each do |room_name, room_instance|
            puts "#{room_name} : #{room_instance.available_space}"
        end
    end

end #Class End
