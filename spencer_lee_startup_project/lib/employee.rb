class Employee

    def initialize(str, str1)
        @name = str
        @title = str1
        @earnings = 0
    end

    def name
        @name
    end

    def title
        @title
    end

    def pay(num)
        @earnings += num
    end
end
