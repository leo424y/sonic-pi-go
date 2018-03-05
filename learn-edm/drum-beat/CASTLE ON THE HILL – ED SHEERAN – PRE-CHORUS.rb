def says(x) x.delete(' ').split('').map{|s| s.to_i} end
  use_bpm 135

drum_kits = {
  hi: :drum_tom_hi_hard,
  md: :drum_tom_lo_hard,
  lo: :drum_bass_hard,
}

in_thread(name: :drum_machine) do
  hi says '0 0 2 0  0 2 0 0  0 0 1 0  0 2 0 1'
  md says '1 1 2 1  1 2 1 1  1 1 1 1  1 2 1 1'
  lo says '1 0 2 0  1 0 1 0  1 0 1 0  1 0 1 0'
end

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[name], amp: p/3.0
      sleep 0.5
    end
  end
end
drum_kits.keys.each do |x| define x do |pattern| run_pattern x, pattern end end
