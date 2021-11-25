require_relative 'events'

module GameData
  SCENES = {
    desert: {
      intro_description: <<~TEXT,
                           Standing atop a hill, you take in the expanse of a desolate desert stretching in all directions.
                           The dry air's heat is dwarfed by that of the beating sun's.

                           A strange shimmer can be seen to the WEST. A mirage?
                           A tall black obelisk pierces the horizon to the EAST.
                           To the SOUTH, a strange whisper emanates.
                         TEXT
      idle_event: EVENTS[:desert_idle],
      choices: {
        'east' => EVENTS[:desert_east],
        'south' => {
          # TODO
        },
        'west' => EVENTS[:desert_west],
      }
    },
    shimmer: {
      intro_description: <<~TEXT,
                           Soon your vision itself is shimmering. The vibrations grow in your body.
                           Your very thoughts SHIMMER.
                           You need to go BACK.
                         TEXT
      idle_event: EVENTS[:shimmer_idle],
      choices: {
        'shimmer' => '',
        'back' => EVENTS[:shimmer_back]
      }
    },
    obelisk: {
      intro_description: <<~TEXT,
                           By the time the OBELISK looms ahead of you, a starry night SKY twinkles above you, the midday sun nowhere in sight.
                         TEXT
      idle_event: EVENTS[:obelisk_idle],
      choices: {
        'sky': {
          # TODO
        },
        'obelisk': {
          # TODO
        }
      }
    }
  }
end
