require_relative 'events'

module GameData
  SCENES = {
    desert: {
      intro_description: <<~TEXT,
                           Standing atop a dune, you take in the expanse of a desolate desert stretching in all directions.
                           The dry air's heat is dwarfed by that of the beating sun's.

                           A strange shimmer can be seen to the WEST. A mirage?
                           A tall black obelisk pierces the horizon to the EAST.
                           To the SOUTH, a strange whisper emanates.
                         TEXT
      idle_event: EVENTS[:desert_idle],
      choices: {
        'east' => EVENTS[:desert_east],
        'south' => EVENTS[:desert_south],
        'west' => EVENTS[:desert_west],
      }
    },
    nothing: {
      intro_description: <<~TEXT,
                           You feel silly, and scared.
                         TEXT
      idle_event: EVENTS[:nothing_idle],
      choices: {
        'back' => EVENTS[:nothing_back]
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
        'shimmer' => EVENTS[:shimmer_death],
        'back' => EVENTS[:shimmer_back]
      }
    },
    obelisk: {
      intro_description: <<~TEXT,
                           By the time the OBELISK looms ahead of you, a starry night SKY twinkles above you, the midday sun nowhere in sight.
                         TEXT
      idle_event: EVENTS[:obelisk_idle],
      choices: {
        'sky' => EVENTS[:obelisk_sky],
        'obelisk' => EVENTS[:obelisk_fight_start]
      }
    },
    obelisk_fight: {
      intro_description: <<~TEXT,
                           The obelisk radiates aggression and hate. It yearns for the SUN that it cannot reach.
                         TEXT
      idle_event: EVENTS[:obelisk_fight_mantra],
      choices: {
        'sun' => EVENTS[:obelisk_death],
        'arch enemy' => EVENTS[:obelisk_victory]
      }
    }
  }
end
