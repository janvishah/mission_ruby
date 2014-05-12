###
# Q. Why does line 26 not print out "false" when we marked taken as true by calling mark_taken_as_true on line 25?
###

###
# A.   
###
class Book
  attr_accessor :taken    #- This will create two method "taken" and "taken="
  # def taken
  #   @taken 
  # end

  # def taken=(taken)
  #   @taken = taken
  # end

  # When you call this method the "taken" variable is defined but it has not assign any value so its 'nil'. 
  def is_available?
    if taken == false     #- It will call taken method of which has instance variable '@taken' and its value is 'nil'. So 'nil != false' 
      return true         
    else
      return false        #- #- So it will return false.
    end
  end

  def mark_taken_as_true
    taken = false         #- This "taken" is local variable and its value is valid in its local scope,which is method mark_taken_as_true
  end                     #- It will not affect the value of other scopes.
end

book = Book.new
puts book.is_available?   #- It will return false cause of " nil == false "
book.taken = false        #- This will call taken= method and assign '@taken = false'
puts book.is_available?   #- now value of "@taken = false" in taken method so condition is true and return true.
puts book.mark_taken_as_true   # This does not affect value of '@taken'. Because "taken" in this method is local variable.
puts book.is_available?   #- Thats why this print true because the value of "@taken" in this method is still false.
