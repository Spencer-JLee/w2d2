require_relative "room"

class Hotel
    def initialize(str, hash)
        @name = str
        @rooms = Hash.new(0)

        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        new_name = []
        words = @name.split(" ")
        
        words.each do |word|
            new_name.push(word.capitalize)
        end

        new_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(str)
        @rooms.has_key?(str)
    end

    def check_in(person, room)
        if !room_exists?(room)
            p "sorry, room does not exist"
        else
            if !@rooms[room].add_occupant(person)
                p "sorry, room is full"
            else
                p "check in successful"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |k, v|
            return true if !v.full?
        end

        false
    end

    def list_rooms
        @rooms.each do |k, v|
            p k + v.available_space.to_s
        end
    end

end
