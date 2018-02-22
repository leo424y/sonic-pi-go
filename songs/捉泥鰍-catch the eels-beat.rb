# catch the eels 捉泥鳅
# https://www.youtube.com/watch?v=db2P8qX0UTk
# install http://sonic-pi.net
use_bpm 60*10

s = 1.0 / 8 #s is speed multiplier 1.0 / 8 makes crotchet 1s or 60 crotchets/minute the default bpm
#note use of 1.0 to make the variable floating point and not integer
s = 2 * s #semi-quaver
c = 4 * s #quaver
cs = 6 * s #quaver dotted
o = 8 * s #crotchet
oc = 12 * s #crotchet dotted
oo = 16 * s #minim
ooo = 24 * s #minim dotted
oooo = 32 * s #brevea

use_synth :dsaw #default

o1 = [:a,:a,:g,:a,:g,:e]
o2 = [:g,:e,:e,:d,:e]
o3 = [:d,:d,:c,:d,:d,:g]
o4 = [:f,:f,:f,:e,:d,:e]
o5 = [:g,:g,:g,:g,:g,:b]
o6 = [:a,:a,:a,:a,:g,:a]
o7 = [:c5,:c5,:c5,:b,:g]
o8 = [:a,:a,:a,:a,:g,:a,:g,:e]

x1 = [oo, oc, c, o, o, oo]
x2 = [o, o, o, o, oooo]
x3 = [o, c, c, o, o, oooo]
x4 = [oo, o, o, oo, oo]
x5 = [o, c, c, o, o, oc, c, oo]

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
