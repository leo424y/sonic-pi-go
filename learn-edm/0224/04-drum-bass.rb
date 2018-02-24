use_bpm 60

in_thread(name: :drum_machine) do
  use_kit :drum_bass
  hat   [5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5]
  hat2  [0, 0, 0, 0,  0, 0, 5, 0,  0, 0, 5, 0,  5, 0, 0, 0]
  hat3  [0, 0, 0, 0,  5, 0, 0, 0,  0, 0, 0, 0,  5, 0, 0, 0]
  kick  [0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0]
  snare [9, 0, 0, 0,  0, 0, 0, 0,  0, 0, 9, 0,  0, 0, 0, 0]
end

drum_kits = {
  drum_bass: {
    hat:   :drum_cymbal_soft,
    hat2:   :drum_cymbal_open,
    hat3:   :drum_cymbal_hard,
    kick:  :drum_heavy_kick,
    snare: :drum_snare_soft
  },
}
current_drum_kit = drum_kits[:acoustic]


define :use_kit do |kit_name|
  current_drum_kit = drum_kits[kit_name]
end

live_loop :pulse do
  sleep 0.1
end

define :run_pattern do |name, pattern|
  live_loop name do
    sync :pulse
    pattern.each do |p|
      sample current_drum_kit[name], amp: p/9.0
      sleep 0.25
    end
  end
end

define :hat do |pattern|
  run_pattern :hat, pattern
end
define :hat2 do |pattern|
  run_pattern :hat2, pattern
end
define :hat3 do |pattern|
  run_pattern :hat3, pattern
end

define :kick do |pattern|
  run_pattern :kick, pattern
end

define :snare do |pattern|
  run_pattern :snare, pattern
end
