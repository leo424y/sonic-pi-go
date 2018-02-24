def says(x) x.delete(' ').split('').map{|s| s.to_i} end
use_bpm 95

in_thread(name: :drum_machine) do
  hat   says '5555 5555 5555 5555'
  snare says '0090 0900 0090 0900'
  kick  says '9909 9000 9909 9000'
end

drum_kits = {
    hat2: :drum_cymbal_soft,
    hat: :drum_cymbal_pedal,
    snare: :drum_snare_hard,
    kick:  :drum_tom_lo_hard,
}

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[name], amp: p/9.0
      sleep 0.5
    end
  end
end
drum_kits.keys.each { |x| define x { |pattern| run_pattern x, pattern } }
