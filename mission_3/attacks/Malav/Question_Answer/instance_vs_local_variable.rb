# Example of without using attr_accessor, difference between local_variables and instance_variables

class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def print_name
    puts name.inspect
  end

  def print_instance_variable_name
    puts @name.inspect
  end

  def change_name_value
    name = "desai"
  end

  def change_instance_variable_name_value
    @name = "desai"
  end
end

p = Person.new
p.print_name                           #- this will call name method which has instance_variable defines but when you create new object this will not get any value so print 'nil'
p.print_instance_variable_name         #- this will print instance_variable '@name' which is defined in name method but dont have value so print 'nil'. 

p.change_name_value                    #- now 'name = desai' which means local variable 'name' has value 'desai'
p.print_name                           #- prints "nil", cause this local variable is different from other variables. And its scope is within this method only.

p.change_instance_variable_name_value  #- now instance_variable '@name' has value of 'desai'
p.print_instance_variable_name         #- print "desai", because instance_variable's scope is within current object so it will print 'desai'
                                       #- Cause we have defined its value in change_instance_variable_name_value method

p.print_name                           #- Now at this time we have set '@name = desai' in change_instance_variable_name_value method. So this print_name method will call name method and print '@name' value.
