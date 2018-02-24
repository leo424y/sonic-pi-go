use_bpm 139

in_thread(name: :drum_machine) do
  hat   [5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5,]
  snare [0, 0, 9, 0,  0, 0, 9, 0,  0, 0, 9, 0,  0, 0, 9, 0,]
  kick  [9, 0, 0, 0,  9, 0, 0, 0,  9, 0, 9, 0,  0, 9, 0, 0,]
end

drum_kits = {
  default: {
    hat:   :drum_cymbal_pedal,
    snare: :drum_snare_hard,
    kick:  :drum_heavy_kick,
  },
}
current_drum_kit = drum_kits[:default]

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample current_drum_kit[name], amp: p/9.0
      sleep 0.5
    end
  end
end
[:hat, :kick, :snare].each { |x| define x { |pattern| run_pattern x, pattern } }
