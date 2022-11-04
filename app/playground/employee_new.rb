class EmployeeNew
    attr_reader :name, :surname
    attr_writer :name, :surname

    attr_accessor :name, :surname # reader + writer
    
    def initialize(name, surname)
        @name = name # not exposed 
        @surname = surname
    end

    def full_name
        "#{@name} - #{@surname}"
    end

    def name(name:, surname:) # if more than 3, 4 params when difficult to remember the order
                                # does not matter the order but we need to pass hash
                                # martyna.name({name: 'martyna', surname: 'markiel'})
        "#{@name} - #{@surname}"
    end

    def put_in_uppercase(character)
        character.upcase
    end

    def transform
        full_name.each_char do |character|
            yield character
        end
    end

    def transform(evil_letter) # with param
        full_name.each_char do |character|
            yield character if evil_letter != character
        end
    end

    # martyna.transform { |character| p character.upcase }
    # martyna.transform("a") { |character| p character.upcase }

    # class methods, can only be called from the class, not from the instance
    def self.definition
        'nanana'
    end

    class << self
        def class_method
        end
    end

    private # private method

    def show_upcase
        full_name.upcase
    end

end
