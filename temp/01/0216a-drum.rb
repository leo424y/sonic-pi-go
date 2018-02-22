use_bpm 200
use_random_seed 42

live_loop :drum do
  ##| a,b = [[:Ab,:major], [:F, :minor], [:C, :minor], [:G, :minor]].choose
  ##| a,b = [[:c,:major], [:a, :minor], [:d, :minor], [:g, :major]].choose
  a,b = [[:g,:major], [:a, :minor], [:d, :minor], [:c, :major]].choose
  cue :key, a: a, b: b
  if true then
    with_fx :reverb do
      4.times do
        sample :drum_tom_mid_hard, amp: ring(4,0,2,2,0,2,2,2).tick
        sleep 1
      end
    end
  else
    sleep 4
  end
end

##| 2.times do
##|   sync :drum
##| end

##| live_loop :bass do
##|   x = sync :key
##|   c = chord(x[:a], x[:b])
##|   uncomment do
##|     with_synth :beep do
##|       with_transpose 10 do
##|         with_synth_defaults cutoff: rrand(60, 90) do
##|           4.times do
##|             play c[0]
##|             sleep 0.5
##|           end
##|           play c.choose
##|           sleep 0.5
##|           3.times do
##|             play c[0]
##|             sleep 0.5
##|           end
##|         end
##|       end
##|     end
##|   end
##| end

##| 2.times do
##|   sync :bass
##| end

##| live_loop :one do
##|   x = sync :key
##|   c = chord(x[:a], x[:b])
##|   uncomment do
##|     with_synth :subpulse do
##|       with_fx :band_eq, mix: 0.2, phase: rrand(3, 6), amp: 2 do
##|         play c, sustain: rrand(3, 6)
##|       end
##|     end
##|   end
##| end

##| 3.times do
##|   sync :one
##| end

##| live_loop :two do
##|   x = sync :key
##|   c = chord(x[:a], x[:b])
##|   r = spread(dice(8), 8)
##|   uncomment do
##|     with_synth :piano do
##|       with_transpose 12 do
##|         with_fx :pan, amp: 2, pan: rrand(-1,1), pan_slide: rrand(1,4) do |fx|
##|           8.times do
##|             play c.choose if r.tick
##|             control fx, pan: rrand(-1, 1)
##|             sleep 0.5
##|           end
##|         end
##|       end
##|     end
##|   end
##| end
