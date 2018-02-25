use_bpm 118
bit_lengh = 0.25

def says(x) x.delete(' ').split('').map{|s| s.to_i} end

in_thread(name: :drum_machine) do
  hi says '1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0  1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0'
  md says '2 0 0 0 2 0 0 0 2 0 0 0 2 0 0 0  2 0 0 0 2 0 0 0 2 0 0 0 2 0 0 0'
  lo says '0 0 0 2 0 0 2 0 0 0 0 0 2 0 2 0  0 0 0 2 0 0 2 0 0 0 0 0 2 0 2 0'
end

drum_kits = {
  hi: :drum_cymbal_pedal,
  md: :drum_snare_hard,
  lo: :drum_bass_hard,
}

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[name], amp: p/3.0
      sleep bit_lengh
    end
  end
end
drum_kits.keys.each do |x| define x do |pattern| run_pattern x, pattern end end
