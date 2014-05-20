# file to make pluralize name
require 'active_support/inflector'


module ActiveRecord
  class Base

    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat vars
    end

    def self.attributes
      @attributes
    end
   
    def attributes     
      self.class.attributes
    end

    def self.all      
      #get csv file in the class
      name = self.name.pluralize.downcase                  

      i = 0;         
      @data = []
      CSV.foreach("./database/#{name}.csv") do |row|
        col = row.length
        f = self.new
        (0..col-1).each_with_index do |col_num,index|
          f.attributes[index] = row[index] if i != 0                                     
        end   
        @data.push(f) if i>0  
        i = i + 1
      end      
      @data
    end
  end
end
