/*  puzzle-input  %txt  /lib/advent-2022/day1/txt
:-  %say
|=  *
=<  :-  %noun
    :-  [%part-1 part-1]  [%part-2 part-2]
|%
++  part-1
  (roll sums max)
++  part-2
  =+  (sort sums gth)
  ;:  add
    (snag 0 -)
    (snag 1 -)
    (snag 2 -)
  ==
++  sums
 ^-  (list @ud)
 =/  parsed  (turn puzzle-input |=(line=@t (rush line dem)))
 =|  sums=(list @ud)
 =|  current-sum=@ud
 |-
 ?~  parsed  sums
 =/  current  -:parsed
 ?~  current 
   %=  $
     sums         (snoc sums current-sum)
     current-sum  0
     parsed       +:parsed
   ==
 %=  $
   current-sum  (add current-sum +:current)
   parsed       +:parsed
 ==
--
