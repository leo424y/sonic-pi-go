# https://www.edmprod.com/drums-guide/
#
# Adding Interest and Variation
# No one wants to listen to the exact same 1-bar drum loop for 16 bars. It’s boring. Yes, you should have a core drum loop: in most dance music this will be your kick, clap, hat, and maybe toms or other percussion—the sounds that play every bar. But you also want to add material to make the drum loop more interesting.
#
# I recommend following the 2/4/8 approach, which goes something like this:
#
# Every 2 bars, have a particular drum hit play
# Every 4 bars, have a new drum hit play that’s bigger or louder than the 2 bar one
# Every 8 bars, have another drum hit play that’s bigger than both the 2 bar and 4 bar hit
# In practice, this might look like:
#
# 2 bars: reverse clap before the last clap on the 4th beat of the 2nd bar.
# 4 bars: deep tom on the last 16th of the 4th bar
# 8 bars: gated snare on the last beat of the 8th bar

use_bpm 180
t2 = ring(1,0,0,0,1,0,0,0).tick
t4 = ring(1,0,1,0,1,0,1,0).tick
t8 = ring(1,1,1,1,1,1,1,1).tick

define :bass do
  play sample :drum_tom_hi_soft
  sleep t2
end
define :mid do
  play sample :drum_tom_hi_hard
  sleep t4
end
define :low do
  play sample :drum_snare_soft
  sleep t8
end

16.times do
  bass
  mid
  low
end
