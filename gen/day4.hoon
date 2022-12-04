/*  puzzle-input  %txt  /lib/advent-2022/day4-input/txt
:-  %say
|=  *
|^  :+  %noun
        part-1
        part-2
::
++  part-1
  =/  lines  (turn puzzle-input trip)
  =/  pairs  (turn lines |=(line=tape (scan line parse-line)))
  =/  containing
    %+  skim  pairs
    |=  [p=range q=range]
    |((contains p q) (contains q p))
  (lent containing)
++  part-2
  =/  lines  (turn puzzle-input trip)
  =/  pairs  (turn lines |=(line=tape (scan line parse-line)))
  =/  overlapping  (skim pairs overlaps)
  (lent overlapping)
::
+$  range  [start=@ud end=@ud]
++  parse-range  ;~((glue hep) dem dem)
++  parse-line   ;~((glue com) parse-range parse-range)
++  contains
  |=  [=range other=range]
  ^-  ?
  &((lte start.range start.other) (gte end.range end.other))
++  overlaps
  |=  [=range other=range]
  ^-  ?
  ?~  (~(int in (silt (gulf start.range end.range))) (silt (gulf start.other end.other)))
    %.n
  %.y
--
