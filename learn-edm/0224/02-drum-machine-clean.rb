use_bpm 60

in_thread(name: :drum_machine) do
  use_kit :acoustic_soft
  hat   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0]
  kick  [9, 0, 0, 0,  9, 0, 0, 0,  9, 0, 0, 0,  9, 0, 0, 0]
  snare [9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0]
end

drum_kits = {
  acoustic: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_hard,
    snare: :drum_snare_hard
  },
  acoustic_soft: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_soft,
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
