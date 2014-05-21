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
        f = self.new
        if i == 0
          (0..col-1).each do |col_num|          
            attr_names.push(row[col_num].strip)
          end
        else   
          attr_names.each_with_index do |attr_name,index|  
            puts attr_name                    
            f.send("#{attr_name}=",row[index])
          end
        end                    
        data.push(f) if i>0                
        end
        i = i + 1
      end          
      data      
    end
  end
end