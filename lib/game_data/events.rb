module GameData
  EVENTS = {
    desert_east: {
      scene_transition: :obelisk,
      description: <<~TEXT
                     Maybe this alien structure is your way out of here; a landmark usually means people are nearby.
                     Although you get the unsettling feeling that the obelisk was not made by a human.
                     What should be a day's trek takes you a few minutes. With each step you take, the sun dims ever so slightly,
                     and a single gleam settles into the sky.
                   TEXT
    },
    desert_idle: {
      description: <<~TEXT
                     A strange shimmer can be seen to the WEST. A mirage?
                     A tall black obelisk pierces the horizon to the EAST.
                     To the SOUTH, a strange whisper emanates.
                   TEXT
    },
    obelisk_idle: {
      description: <<~TEXT
                     An obsidian OBELISK looms ahead of you. A starry night SKY twinkles above.
                   TEXT
    }
  }
end
