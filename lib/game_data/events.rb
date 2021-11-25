require_relative '../helpers'

module GameData
  EVENTS = {
    desert_east: {
      transition: {
        type: Helpers::TransitionTypes::NEW_SCENE,
        target: :obelisk
      },
      description: <<~TEXT
                     Maybe this alien structure is your way out of here; a landmark usually means people are nearby.
                     Although you get the unsettling feeling that the obelisk was not made by a human.
                     What should be a day's trek takes you a few minutes. With each step you take, the sun dims ever so slightly,
                     and a single gleam settles into the sky. By the time the OBELISK looms ahead of you, a starry night SKY
                     twinkles above you, the midday sun nowhere in sight.
                   TEXT
    },
    desert_idle: {
      transition: {
        type: Helpers::TransitionTypes::NONE
      },
      description: <<~TEXT
                     A strange shimmer can be seen to the WEST. A mirage?
                     A tall black obelisk pierces the horizon to the EAST.
                     To the SOUTH, a strange whisper emanates.
                   TEXT
    }
  }
end
