# catch the eels 捉泥鳅
# https://www.youtube.com/watch?v=db2P8qX0UTk
# install http://sonic-pi.net
use_bpm 60*10

s = 1.0 / 4 #s is speed multiplier 1.0 / 8 makes crotchet 1s or 60 crotchets/minute the default bpm
#note use of 1.0 to make the variable floating point and not integer
c = 2 * s #semi-quaver
o = 4 * s #quaver
oc = 6 * s #quaver dotted
oo = 8 * s #crotchet
ooo = 12 * s #crotchet dotted
oooo = 16 * s #minim
oooooo = 24 * s #minim dotted
oooooooo = 32 * s #brevea

use_synth :dsaw #default

o1 = [69,69,67,69,67,64]
o2 = [67,64,64,62,64]
o3 = [62,62,60,62,62,67]
o4 = [65,65,65,64,62,64]
o5 = [67,67,67,67,67,71]
o6 = [69,69,69,69,67,69]
o7 = [72,72,72,71,67]
o8 = [69,69,69,69,67,69,67,64]

x1 = [ oooo ,ooo,o,oo,oo,oooo]
x2 = [ oo,oo,oo,oo, oooooooo ]
x3 = [oo,o,o,oo,oo, oooooooo ]
x4 = [ oooo ,oo,oo,oooo, oooo]
x5 = [oo,o,o,oo,oo,ooo,o,oooo]

in_thread do #play the various parts together using threads
2.times do
  play_pattern_timed(o1,x1)
  play_pattern_timed(o2,x2)
  play_pattern_timed(o3,x1)
  play_pattern_timed(o2,x2)
  play_pattern_timed(o1,x1)
  play_pattern_timed(o4,x3)
  play_pattern_timed(o5,x1)
  play_pattern_timed(o6,x3)
  play_pattern_timed(o7,x4)
  play_pattern_timed(o8,x5)
  play_pattern_timed(o5,x1)
  play_pattern_timed(o6,x3)
end
  play_pattern_timed(o7,x4)
  play_pattern_timed(o8,x5)
2.times{play_pattern_timed(o5,x1);play_pattern_timed(o6,x3)}
end
