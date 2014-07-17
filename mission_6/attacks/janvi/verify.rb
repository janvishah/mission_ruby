# return  1: Player entering 1 won
# return  0: Player entering 0 won
# return -1: Nobody won
def verify(ans_arr, arr)
  p1 = []
  p2 = []
  [0,1,2].each do |i|
    [0,1,2].each do |j|
      if arr[i][j] == 1        
        p1.push(ans_arr[i][j])
      elsif arr[i][j] == 0
        p2.push(ans_arr[i][j])      
      end
    end
  end
  
  if p1.length == 3    
    puts "Player entering 1 won" if p1[p1.length-1] + p1[p1.length-2] + p1[p1.length-3] == 15
  end
  if p1.length == 4
    puts "Player entering 1 won" if p1[p1.length-1] + p1[p1.length-2] + p1[p1.length-4] == 15
    puts "Player entering 1 won" if p1[p1.length-2] + p1[p1.length-3] + p1[p1.length-4] == 15
    puts "Player entering 1 won" if p1[p1.length-1] + p1[p1.length-3] + p1[p1.length-4] == 15
  end
  if p1.length == 5
    puts "Player entering 1 won" if p1[p1.length-1] + p1[p1.length-2] + p1[p1.length-5] == 15 || 
                          p1[p1.length-1] + p1[p1.length-3] + p1[p1.length-5] == 15 ||
                          p1[p1.length-1] + p1[p1.length-4] + p1[p1.length-5] == 15 ||
                          p1[p1.length-2] + p1[p1.length-3] + p1[p1.length-5] == 15 ||
                          p1[p1.length-2] + p1[p1.length-4] + p1[p1.length-5] == 15 || 
                          p1[p1.length-3] + p1[p1.length-4] + p1[p1.length-5] == 15     
  end
  if p2.length == 3    
    puts "Player entering 0 won" if p2[p2.length-1] + p2[p2.length-2] + p2[p2.length-3] == 15
  end
  if p2.length == 4
    puts "Player entering 0 won" if p2[p2.length-1] + p2[p2.length-2] + p2[p2.length-4] == 15
    puts "Player entering 0 won" if p2[p2.length-2] + p2[p2.length-3] + p2[p2.length-4] == 15
    puts "Player entering 0 won" if p2[p2.length-1] + p2[p2.length-3] + p2[p2.length-4] == 15
  end
  if p2.length == 5
    puts "Player entering 0 won" if p2[p2.length-1] + p2[p2.length-2] + p2[p2.length-5] == 15 || 
                          p2[p2.length-1] + p2[p2.length-3] + p2[p2.length-5] == 15 ||
                          p2[p2.length-1] + p2[p2.length-4] + p2[p2.length-5] == 15 ||
                          p2[p2.length-2] + p2[p2.length-3] + p2[p2.length-5] == 15 ||
                          p2[p2.length-2] + p2[p2.length-4] + p2[p2.length-5] == 15 || 
                          p2[p2.length-3] + p2[p2.length-4] + p2[p2.length-5] == 15     
  end
end
