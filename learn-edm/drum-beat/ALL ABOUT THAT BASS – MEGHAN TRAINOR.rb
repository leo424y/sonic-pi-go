def say(x) x.delete(' ').split('').map{|s| s.to_i} end
use_bpm 134

in_thread(name: :drum_machine) do
  snare say '0090 0090 0099 0090'
  kick  say '9000 0909 9000 9909'
end

drum_kits = {
  default: {
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
