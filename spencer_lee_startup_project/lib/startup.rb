require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(str)
        @salaries.has_key?(str)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            employee = Employee.new(name, title)
            @employees.push(employee)
        else 
            raise
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= salaries[employee.title]
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else
            raise
        end
    end

    def payday
        @employees.each do |n|
            pay_employee(n)
        end
    end

    def average_salary
        sum = 0

        @employees.each do |n|
            sum += salaries[n.title]
        end

        sum / @employees.length
    end

    def close
        @employees = []

        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v 
            end
        end

        startup.employees.each do |n|
            @employees.push(n)
        end

        startup.close
    end
end
