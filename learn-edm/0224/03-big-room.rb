use_bpm 120

in_thread(name: :drum_machine) do
  use_kit :big_room
  hat   [0, 0, 0, 5,  0, 0, 5, 0,  0, 0, 5, 0,  0, 0, 0, 5]
  kick  [9, 0, 0, 0,  9, 0, 0, 0,  9, 0, 0, 0,  9, 0, 0, 0]
  snare [9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0]
end

drum_kits = {
  big_room: {
    hat:   :drum_tom_hi_hard,
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

define :kick do |pattern|
  run_pattern :kick, pattern
end

define :snare do |pattern|
  run_pattern :snare, pattern
end
