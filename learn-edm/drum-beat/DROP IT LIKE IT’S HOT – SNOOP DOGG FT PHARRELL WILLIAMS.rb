def say(x) x.delete(' ').split('').map{|s| s.to_i} end
use_bpm 92

in_thread(name: :drum_machine) do
  snare say '0000 9000 0000 9000'
  kick  say '9009 9090 0090 0000'
end

drum_kits = {
  default: {
    snare: :drum_snare_hard,
    kick:  :drum_tom_lo_hard,
  },
}

define :run_pattern do |name, pattern|
  live_loop name do
    pattern.each do |p|
      sample drum_kits[:default][name], amp: p/9.0
      sleep 0.25
    end
  end
end
[:hat, :kick, :snare].each { |x| define x { |pattern| run_pattern x, pattern } }
