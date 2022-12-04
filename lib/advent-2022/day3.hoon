|%
++  compartments
  |=  line=tape
  ^-  [tape tape]
  =/  midpoint  (div (lent line) 2)
  :-  (scag midpoint line)
      (slag midpoint line)
++  intersect
  |=  [p=(set @) q=(set @)]
  (~(int in p) q)
++  priority
  |=  item=@t
  ^-  @ud
  ?:  &((gte item 'a') (lte item 'z'))
    :(sub item 'a' 1)
  ?:  &((gte item 'A') (lte item 'Z'))
    :(sub item 38) 
  !!
++  group
  |=  lines=(list @t)
  ^-  (list (list @t))
  =/  groups  *(list (list @t))
  |-
  ?~  lines  groups
  %=  $
    groups  (snoc `(list (list @t))`groups `(list @t)`(scag 3 `(list @t)`lines))
    lines   `(list @t)`(slag 3 `(list @t)`lines)
  ==
--
