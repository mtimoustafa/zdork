require_relative 'events'

module GameData
  SCENES = {
    desert: {
      description: <<~TEXT,
                     Standing atop a hill, you take in the expanse of a desolate desert stretching in all directions.
                     The dry air's heat is dwarfed by that of the beating sun's.
                   TEXT
      idle_event: EVENTS[:desert_idle],
      choices: {
        'east' => EVENTS[:desert_east],
        'south' => {
          # TODO
        },
        'west' => {
          # TODO
        }
      }
    },
    obelisk: {
      description: <<~TEXT,
                    An obsidian OBELISK looms ahead of you. A starry night SKY twinkles above.
                   TEXT
      idle_event: EVENTS[:obelisk_exterior],
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
