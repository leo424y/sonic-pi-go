live_loop :fireworks do
  synth :gnoise,
    amp: rrand(0.1, 1.5),
    attack: rrand(0.01, 0.03),
    cutoff: rrand(100, 130),
    pan: rrand(-1, 1)
    sleep rrand(0.01, 0.05)
end
