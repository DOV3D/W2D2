class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            false
        else
            true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(person)
       if !self.full?
        @occupants << person
        return true
       else
        false
       end
    end

end #End Class
