class Employee < HumanNew
    include ExampleCode # taking from common_code
    
    def initialize(name, surname)
        @surname = surname # not exposed 
        super name # call this methof from the parent class
    end

    def full_name
        "#{@name} - #{@surname}"
    end

    # getter
    def surname 
        @surname
    end

    # setter
    def name=(new_value)
        @name = new_value
    end 
end
