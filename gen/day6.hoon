/*  puzzle-input  %txt  /lib/advent-2022/day6-input/txt
:-
%say
|=  *
|^  :+  %noun
        part-1
        part-2
::
++  part-1  (solve 4) 
++  part-2  (solve 14) 
::
++  solve
  |=  window-size=@ud
  ^-  @ud
  =/  string  (trip -:puzzle-input)
  =|  index=@ud
  |-
  =/  window  (silt (swag [index window-size] string))
  ?:  =(window-size ~(wyt in window))
    (add index window-size)
  $(index +(index))
--
