# file to make pluralize name
require 'active_support/inflector'


module ActiveRecord
  class Base

    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat vars
      super(*vars)
    end

    def self.attributes
      @attributes
    end

    def attributes
      self.class.attributes
    end

    def self.all
      # get model name
      puts self.name
      
      #get table name
      puts self.name.pluralize
      
      #get csv file in the class
      name = self.name.pluralize.downcase            
    
      i = 0;         
      @data = []
      CSV.foreach("./database/#{name}.csv") do |row|
        col = row.length
        f = self.new
        (0..col-1).each_with_index do |col_num,index|
          if i != 0                   
            f.attributes[index] = row[index]           
          end           
        end   
        if i>0  
          @data.push(f)          
        end
        i = i + 1
      end      
      @data
    end
  end
end
