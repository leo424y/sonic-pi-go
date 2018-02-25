def says(x) x.delete(' ').split('').map{|s| s.to_i} end
  use_bpm 180

in_thread(name: :drum_machine) do
  hat   says '1 0 0  1 0 1'
end

drum_kits = {
  hat: :drum_cymbal_soft,
}

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[name], amp: p/3.0
      sleep 0.5
    end
  end
end
drum_kits.keys.each { |x| define x { |pattern| run_pattern x, pattern } }
