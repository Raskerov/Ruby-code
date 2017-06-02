require 'date'
require 'pry' #For debugging purpose
require 'pry-nav' #For debugging purpose

class Task
  attr_accessor :first_date, :second_date

    def initialize(first_date, second_date)
      @first_date = first_date
      @second_date = second_date
    end

    def age_of_death
      set_dates
      count_age
      submit_to_hash
      @result
    end

    def set_dates
      @date_of_birth ||= DateTime.parse(@first_date)
      @date_of_death ||= DateTime.parse(@second_date)
    end

   def count_age
     if @date_of_birth == @date_of_death
       @days = 1
     else
       @days ||= (@date_of_death - @date_of_birth ).to_i
     end

     if @days == 1
       @distance = "1 day"
       @age = 0
     elsif @days < 14
       @distance = "#{@days} days"
       @age = 0
     elsif @days >= 14 && @days < 61
       @distance = "#{@days/7} weeks"
       @age = 0
     elsif @days >= 61 && @days < 336
       @distance = "#{@days/30} months"
       @age = 0
     elsif @days >= 336 && @days < 730
       check_if_leap_year
       if  @days >= 336 && @days < 730
         @distance = "1 year"
         @age = 1
       else
         @distance = "#{@days/30} months"
         @age = 0
       end
     elsif @days >= 730
       leap_year_days
       @distance = "#{@days/365} years"
       @age = @days / 365
     end
   end

   def leap_year_days
     years = @date_of_death.year - @date_of_birth.year
     leap_years = years/4
     @days = @days - leap_years
   end

   def check_if_leap_year
     if @date_of_death.year % 4 == 0  && @date_of_death.month > 3
       @days =-1
     end
   end

   def submit_to_hash
     @result =  { age: @age, distance: @distance  }
   end
end
