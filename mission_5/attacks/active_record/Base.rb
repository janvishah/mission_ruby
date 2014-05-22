# file to make pluralize name
require 'active_support/inflector'


module ActiveRecord
  class Base

    def self.all      
      name = self.name.pluralize.downcase                

      i = 0;         
      data = []
      attr_names = []
      CSV.foreach("./database/#{name}.csv") do |row|
        col = row.length
        s = self.new
        if i == 0
          (0..col-1).each do |col_num|          
            attr_names.push(row[col_num].strip)
          end
        else   
          self_obj = create_object(attr_names,row,s)
        end                    
        data.push(self_obj) if i>0                       
        i = i + 1
      end          
      data      
    end

    def self.find_by(var)
      name = self.name.pluralize.downcase
      i = 0
      place_of_attribute = nil
      key = var.keys[0]
      value = var.values[0]
      attr_names = []
      CSV.foreach("./database/#{name}.csv") do |row|
        s = self.new
        col = row.length        
        if i == 0
          (0..col-1).each do |col_num|                    
            place_of_attribute = col_num if row[col_num].strip == key.to_s           
            attr_names.push(row[col_num].strip)        
          end        
        else
          if row[place_of_attribute].strip == value.to_s           
            return create_object(attr_names,row,s)
          end
        end
        place_of_attribute != nil ? i += 1 : break      
      end 
    end

    def self.find(var)
      name = self.name.pluralize.downcase
      attr_names = []
      place_of_attribute = nil
      i = 0
      CSV.foreach("./database/#{name}.csv") do |row|
        s = self.new
        col = row.length        
        if i == 0
          (0..col-1).each do |col_num|  
            place_of_attribute = col_num if row[col_num].strip == "id"               
            attr_names.push(row[col_num].strip)
          end
        else            
          if row[place_of_attribute].strip.to_i == var           
            return create_object(attr_names,row,s)
          end
        end  
        place_of_attribute != nil ? i += 1 : break  
      end        
    end

    def self.create_object(attr_names,row,s)
      attr_names.each_with_index do |attr_name,index|                              
        s.send("#{attr_name}=",row[index].strip)
      end
      return s
    end

  end
end