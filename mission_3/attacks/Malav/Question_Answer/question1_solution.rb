class Book
  attr_accessor :taken
  # def taken
  #   @taken 
  # end

  # def taken=(taken)
  #   @taken = taken
  # end

  # When you call this method the "@taken" instance variable is defined but it has not assign any value so it is 'nil'. 
  def is_available?
    if @taken == false    #- At first method call, this line it will check condition like " nil == false ", which is false. 
      puts @taken         #- This will print nil first time.  
      return true         #- So it will return false.
    else
      puts @taken
      return false
    end
  end

  def mark_taken_as_true
    @taken = true         #- This "@taken" is instance variable and its value is valid within current object and associated to current object scope.
  end                     #- It will affect value of other scope means value of "@taken" in is _available? method
end

book = Book.new
puts book.is_available?   #- It will return false cause of " nil == false "
book.taken = false        #- Set "@taken = false". It calls taken= method and set value.
puts book.is_available?   #- now value of "@taken = false" so condition is true and return true.
puts book.mark_taken_as_true   # This updates value of "@taken". Cause this is same instance variable of Book's object.
puts book.is_available?   #- So now this will print false because value of "@taken" is true.

## OUTPUT:
# nil
# false
# false
# true
# true
# true
# false