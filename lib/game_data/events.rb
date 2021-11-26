module GameData
  def self.events
    {
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
      desert_south: {
        scene_transition: :nothing,
        description: <<~TEXT
                       You don't know if you're dehydrated or if someone's actually calling for you. One thing's for sure, investigating
                       the voice is better than staying on this forsaken dune.
                       You slide down the sand and look to the horizon. Nothing but the blue sky and the wind breezing.
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
      nothing_back: {
        scene_transition: :desert,
        description: <<~TEXT
                       The fact that the climb up is much more difficult than sliding down mixes frustration into your terror.
                     TEXT
      },
      nothing_idle: {
        description: <<~TEXT
                       The wind tickles your face; the sun beats down on it.
                       You feel silly, and scared.
                       Maybe you should climb BACK up the dune.
                     TEXT
      },
      shimmer_death: {
        causes_death: true,
        death_message: 'theshimmer',
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
      },
      obelisk_sky: {
        description: <<~TEXT
                       The night sky is a pitch-black backdrop, so much so that the obelisk would fade into it if the stars
                       weren't shining so brightly. Their gleam is intense and in it, you can feel the yearning of the sun.
                     TEXT
      },
      obelisk_death: {
        causes_death: true,
        death_message: 'thesun',
        description: <<~TEXT
                       ALL HOPE IS LOST THE LIGHT IT BLINDS
                     TEXT
      },
      obelisk_fight_start: {
        scene_transition: :obelisk_fight,
        description: <<~TEXT
                       The obelisk pulls at your attention with the force of a thousand suns. It declares itself your ARCH ENEMY.
                       Soon you feel your consciousness melt at the seams. The obelisk wants to fill you with so much light
                       you would burst at the seams. You are in danger.
                     TEXT
      },
      obelisk_fight_mantra: {
        description: <<~TEXT
                       HESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESU
                     TEXT
      },
      obelisk_victory: {
        causes_victory: true,
        description: <<~TEXT
                       You stop resisting the obelisk as your arch enemy. You become as dark as the night sky itself.
                       The obelisk's fury ceases to flow into you. It passes through you like a running river.
                       You feel yourself become weightless. No more shimmering. No more whispering. No more sun.
                     TEXT
      },
    }
  end
end
