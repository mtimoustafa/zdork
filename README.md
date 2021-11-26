# :skull_and_crossbones: ZDORK: A Spoopy Zork Clone :skull_and_crossbones:

A silly little CLI proof-of-concept game written in Ruby, with a spoopy theme and a little twist at the end.

_Thanks for the fun technical test, it was a blast making this_ :smile:

## Requirements
Ruby >= 3.0 and that's it!

You can use a version manager like `rvm`, `rbenv`, or `asdf` for convenience.

## Installation
1. Clone the repository through your method of choice.
2. Navigate into the directory and run `bundle`.

## Running
Use `ruby game.rb` to launch the game.
Use `rspec` to run the test suite.

## Dependencies
Only 3 gems are used:
* `RSpec` as a testing framework.
* [`TTY::Prompt`](https://github.com/piotrmurach/tty-prompt) for easy CLI prompting and printing.
* [`Pastel`](https://github.com/piotrmurach/pastel) for pretty colors!

## Structure
```
zdork/
 |
 |- game.rb                   # Game entry point
 |
 |- lib/
 |   |
 |   |- game_controller.rb    # Controls game state and starting the game
 |   |- game_interface.rb     # Controls game I/O and quitting on game end
 |   |- game_data/            # Data storage for game assets (scenes and events)
 |
 |- spec/                     # Test files for controller and interface
```

## Design Decisions
I decided to split the game up into two modules: a controller and interface. This is to separate the concerns of state and I/O respectively.
I collected all the game's scenes and events into their own namespaced objects for cleanliness. As they're pure Ruby hash objects, they're pretty performant. As they're read-only, every call to them is a O(1) constant lookup time.

Some ideas I was left with:
* Although letting the interface handle exiting the game is convenient, state is the controller's concern. It should be there instead and bubble the game-end event up to `game.rb` which would then quit the process.
* Putting the test event data in `game_controller_spec.rb` in a factory might be worth it, if it gets too big or would need to be re-used.
* `GameController#process_player_commmand` should be split up into different methods if it gets bigger than this, as it's already doing a lot right now.
* The game text in `GameInterface` could be pulled out into a file and put into `game_data/`.

## Caveats
Some "thematic elements" may make it look like the game is broken, but it's by design. Specifically:

* Typing "check" at the obelisk yields `HESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESU`.
* The death message spam is capitalized and concatenated on purpose, and so is the delay right before it.
