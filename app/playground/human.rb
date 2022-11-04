module RubyLessons
    class Human
        def initialize(name)
            @name = name
        end

        def am_i_human
            'yes'
        end
    end
end

# adding extra protection, to avoid issues and class merging if names are duplicated
# martyna = RubyLessons::Human.new
# martyna.class.included_modules