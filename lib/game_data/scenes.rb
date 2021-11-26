require_relative 'events'

module GameData
  def self.scenes
    {
      desert: {
        intro_description: <<~TEXT,
                             Standing atop a dune, you take in the expanse of a desolate desert stretching in all directions.
                             The dry air's heat is dwarfed by that of the beating sun's.

                             A strange shimmer can be seen to the WEST. A mirage?
                             A tall black obelisk pierces the horizon to the EAST.
                             To the SOUTH, a strange whisper emanates.
                           TEXT
        idle_event: self.events[:desert_idle],
        choices: {
          'east' => self.events[:desert_east],
          'south' => self.events[:desert_south],
          'west' => self.events[:desert_west],
        }
      },
      nothing: {
        intro_description: <<~TEXT,
                             You feel silly, and scared.
                           TEXT
        idle_event: self.events[:nothing_idle],
        choices: {
          'back' => self.events[:nothing_back]
        }
      },
      shimmer: {
        intro_description: <<~TEXT,
                             Soon your vision itself is shimmering. The vibrations grow in your body.
                             Your very thoughts SHIMMER.
                             You need to go BACK.
                           TEXT
        idle_event: self.events[:shimmer_idle],
        choices: {
          'shimmer' => self.events[:shimmer_death],
          'back' => self.events[:shimmer_back]
        }
      },
      obelisk: {
        intro_description: <<~TEXT,
                             By the time the OBELISK looms ahead of you, a starry night SKY twinkles above you, the midday sun nowhere in sight.
                           TEXT
        idle_event: self.events[:obelisk_idle],
        choices: {
          'sky' => self.events[:obelisk_sky],
          'obelisk' => self.events[:obelisk_fight_start]
        }
      },
      obelisk_fight: {
        intro_description: <<~TEXT,
                             The obelisk radiates aggression and hate. It yearns for the SUN that it cannot reach.
                           TEXT
        idle_event: self.events[:obelisk_fight_mantra],
        choices: {
          'sun' => self.events[:obelisk_death],
          'arch enemy' => self.events[:obelisk_victory]
        }
      }
    }
  end
end
