# Mission 3

<img src="http://www.dailyfreepsd.com/wp-content/uploads/2014/03/Ruby-Metaprogramming.jpg" width="250px" height="250px" />

### Overview

Executing "ruby main.rb" should produce all "true" values.

* You can only modify active_record/Base.rb file. Don't modify any other existing files.
* You cannot add any other files, classes or modules. You can only create functions in existing classes & modules.
* Consider CSV files in the "database" folder to be your actual database.

### Example

Consider below code.

````ruby
  countries = Country.all
  states = State.all
  cities = City.all
````

For this code to work consider adding code to the Base.rb file which will make
"all" work for each - Country, State & City. In the "all" function you will have
to detect the caller object and accordingly fetch values from the database files.

### Notes

* Code should be indented & comments should be put in wherever required.
