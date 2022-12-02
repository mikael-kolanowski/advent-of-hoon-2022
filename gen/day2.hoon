/*  puzzle-input  %txt  /lib/advent-2022/day2/txt
:-  %say
|=  *
=<  :+  %noun  [%part-1 part-1]
               [%part-2 part-2]
|%
+$  shape  ?(%rock %paper %scissors)
+$  outcome  ?(%win %lose %draw)
+$  round  [opponent=shape player=shape]
++  shape-points
  |=  =shape
  ^-  @ud
  ?-  shape
    %rock      1
    %paper     2
    %scissors  3
  ==
++  beats
  |=  [shape-1=shape shape-2=shape]
  ^-  ?
  =+
  %-  my  :~  [%paper %rock]
              [%scissors %paper]
              [%rock %scissors]
          ==
  =((~(got by -) shape-1) shape-2)
++  play-round
  |=  =round
  ^-  outcome
  ?:  =(opponent.round player.round)
    %draw
  ?:  (beats player.round opponent.round)
    %win
  %lose
++  round-points
  |=  =round
  ^-  @ud
  =/  outcome  (play-round round)
  %+  add  (shape-points player.round)
  ?-  outcome
    %win   6
    %draw  3
    %lose  0
  ==
++  obtain-outcome
  |=  [=shape =outcome]
  ^-  ^shape
  ?-    outcome
      %draw
    shape
      %win
    ?-  shape
     %rock      %paper
     %paper     %scissors
     %scissors  %rock
    ==
     %lose
   ?-  shape
     %rock      %scissors
     %paper     %rock
     %scissors  %paper
   ==
  ==
++  parse-shape
  |=  char=@t
  ^-  shape
  ?:  |(=(char 'A') =(char 'X'))
    %rock
  ?:  |(=(char 'B') =(char 'Y'))
    %paper
  ?:  |(=(char 'C') =(char 'Z'))
    %scissors
  !!
++  parse-round
  |=  line=@t
  ^-  round
  =+  (trip line)
  :-  (parse-shape (snag 0 -))
      (parse-shape (snag 2 -))
++  part-1
  =+
  %+  turn  puzzle-input
    |=  line=@t
    (round-points (parse-round line))
  (roll `(list @ud)`- add)
++  part-2
  |^
  (roll (turn rounds round-points) add)
  ::rounds
  ++  rounds
    ^-  (list round)
    %+  turn  (turn puzzle-input parse-line)
      |=  [=shape =outcome]
      ^-  round
      [shape (obtain-outcome shape outcome)]
     ++  parse-line
      |=  line=@t
      ^-  [=shape =outcome]
      =+  (trip line)
      :-  (parse-shape -<)
          ?:  =((rear -) 'X')
            %lose
          ?:  =((rear -) 'Y')
            %draw
          %win
  --
--
