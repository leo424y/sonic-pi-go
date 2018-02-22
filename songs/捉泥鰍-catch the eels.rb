# catch the eels 捉泥鳅
# https://www.youtube.com/watch?v=db2P8qX0UTk
# install http://sonic-pi.net
use_bpm 600

s = 1.0 / 4 #s is speed multiplier 1.0 / 8 makes crotchet 1s or 60 crotchets/minute the default bpm
#note use of 1.0 to make the variable floating point and not integer
dsq = 1 * s #demi-semi-quaver
sq = 2 * s #semi-quaver
sqd = 3 * s #semi-quaver dotted
q = 4 * s #quaver
qd = 6 * s #quaver dotted
qdd = 7 * s #quaver double dotted
c = 8 * s #crotchet
cd = 12 * s #crotchet dotted
cdd = 14 * s #crotchet double dotted
m = 16 * s #minim
md = 24 * s #minim dotted
mdd = 28 * s #minim double dotted
b = 32 * s #brevea
bd = 48 * s #breve dotted

use_synth :dsaw #default

o1 = [:a,:a,:g,:a,:g,:e]
o2 = [:g,:e,:e,:d,:e]
o3 = [:d,:d,:c,:d,:d,:g]
o4 = [:f,:f,:f,:e,:d,:e]
o5 = [:g,:g,:g,:g,:g,:b]
o6 = [:a,:a,:a,:a,:g,:a]
o7 = [:c5,:c5,:c5,:b,:g]
o8 = [:a,:a,:a,:a,:g,:a,:g,:e]

x1 = [m, cd, q, c, c, m]
x2 = [c, c, c, c, b]
x3 = [c, q, q, c, c, b]
x4 = [m, c, c, m, m]
x5 = [c, q, q, c, c, cd, q, m]

in_thread do #play the various parts together using threads
2.times do
  tune(o1,x1)
  tune(o2,x2)
  tune(o3,x1)
  tune(o2,x2)
  tune(o1,x1)
  tune(o4,x3)
  tune(o5,x1)
  tune(o6,x3)
  tune(o7,x4)
  tune(o8,x5)
  tune(o5,x1)
  tune(o6,x3)
end
  tune(o7,x4)
  tune(o8,x5)
2.times{tune(o5,x1);tune(o6,x3)}
end
