require "./verify.rb"

ans_arr = [ [4, 9, 2],
            [3, 5, 7],
            [8, 1, 6] ]

arr_1 = [ [ 1, 1, 1] ,
          [ 0, 0,-1] ,
          [-1,-1,-1] ]

arr_2 = [ [ 1, 1,-1] ,
          [ 0, 0, 0] ,
          [-1, 1,-1] ]

arr_3 = [ [ 1, 1,-1] ,
          [ 0, 0,-1] ,
          [-1, 1,-1] ]

puts verify(ans_arr, arr_1)
puts verify(ans_arr, arr_2)
puts verify(ans_arr, arr_3)
