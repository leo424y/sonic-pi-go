use_bpm 200

use_synth :prophet #default

in_thread do #play the various parts together using threads
  tune([:c],[1])
end
