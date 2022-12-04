/+  *advent-2022-day3
/*  puzzle-input  %txt  /lib/advent-2022/day3-input/txt
:-  %say
|=  *
=<  :+  %noun
        [%one part-1]
        [%two part-2]
|%
++  part-1
  |^  (roll scores add)
  ++  scores  (turn puzzle-input process-line)
  ++  process-line
    |=  line=@t
    ^-  @ud
    =+  (compartments (trip line))
    =/  overlapping-items  (intersect (silt -<) (silt ->))
    =/  scores  (turn ~(tap in overlapping-items) priority)
    (roll scores add)
  --
++  part-2
  |^  (roll scores add)
  ++  scores
    =/  groups  (group puzzle-input)
    (turn groups process-group)
  ++  process-group
    |=  group=(list @t)
    ^-  @ud
    =/  overlapping-items
    =+  (turn group trip)
    ;:  intersect
      (silt (snag 0 -))
      (silt (snag 1 -))
      (silt (snag 2 -))
    ==
    =/  scores  (turn ~(tap in overlapping-items) priority)
    (roll scores add)
  -- 
--
