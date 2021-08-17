require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name                #String
        @funding = funding          #num
        @salaries = salaries        #hash containing 'title` => `salary` pairs
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

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(emp_name, title)
        if valid_title?(title)
           @employees << Employee.new(emp_name, title)
        else
         raise "Error"   
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp_instance)
        if @funding > @salaries[emp_instance.title]
            emp_instance.pay(@salaries[emp_instance.title])
            @funding -= @salaries[emp_instance.title]
        else
            raise "Error"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
           sum += @salaries[employee.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += startup.employees
        startup.close
    end

end #Class End
