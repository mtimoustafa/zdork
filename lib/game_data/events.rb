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
    desert_west: {
      scene_transition: :shimmer,
      description: <<~TEXT
                     Only a fool would willingly chase a mirage. You can't explain why you're acting like a fool.
                     At first the shimmer held promise. What kind of promise, you can't say.
                     With every step you take towards it, the shimmer grows - larger, but also impossibly in every direction.
                   TEXT
    },
    shimmer_death: {
      causes_death: true,
      death_message: 'shimmerglittervibrations',
      description: <<~TEXT
                     You try to observe the SHIMMER
                     But there is no SHIMMER to OBSERVE
                     There is only EVERYTHING
                     And EVERYTHING OBSERVES the SHIMMER
                     YOU are the SHIMMER and the SHIMMER is YOU
                   TEXT
    },
    shimmer_idle: {
      description: <<~TEXT
                     Your vision itself is shimmering.
                     The vibrations grow in your body.
                     Your very thoughts SHIMMER.
                     You need to go BACK.
                   TEXT
    },
    shimmer_back: {
      description: <<~TEXT
                     There is no back or front. There is no desert, no you. There are only the vibrations.
                   TEXT
    },
    obelisk_idle: {
      description: <<~TEXT
                     An obsidian OBELISK looms ahead of you. A starry night SKY twinkles above.
                   TEXT
    }
  }
end
