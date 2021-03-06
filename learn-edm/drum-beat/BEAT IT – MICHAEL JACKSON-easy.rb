use_bpm 139

in_thread(name: :drum_machine) do
  hat   '5555 5555 5555 5555'.delete(' ').split('').map{|s| s.to_i}
  snare '0090 0090 0090 0090'.delete(' ').split('').map{|s| s.to_i}
  kick  '9000 9000 9090 0900'.delete(' ').split('').map{|s| s.to_i}
end

drum_kits = {
  default: {
    hat:   :drum_cymbal_pedal,
    snare: :drum_snare_hard,
    kick:  :drum_heavy_kick,
  },
}

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[:default][name], amp: p/9.0
      sleep 0.5
    end
  end
end
[:hat, :kick, :snare].each { |x| define x { |pattern| run_pattern x, pattern } }
