# ZDORK: A Spoopy Zork Clone

A silly little CLI proof-of-concept game written in Ruby, with a spoopy theme and a little twist at the end.

_Thanks for the fun technical test, it was a blast making this_ :smile:

## Requirements
Ruby >= 3.0 and that's it!

You can use a version manager like `rvm`, `rbenv`, or `asdf` to preserve other versions you need to keep.

## Installation
1. Clone the repository through your method of choice.
2. Navigate into the directory and run `bundle`.

## Running
Use `ruby game.rb` to launch the game.

## Dependencies
Only 3 gems are used:
* `RSpec` as a testing framework.
* `[TTY::Prompt](https://github.com/piotrmurach/tty-prompt)` for easy CLI prompting and printing.
* `[Pastel](https://github.com/piotrmurach/pastel)` for pretty colors!

## Structure
```
|
|- game.rb                   # Game entry point
|
|- lib/
|   |
|   |- game_controller.rb    # Controls game state and starting the game
|   |- game_interface.rb     # Controls game I/O and quitting on game end
|   |- game_data/            # Data storage for game scenes and events
|
|- spec/                     # Test files for controller and interface
```

## Caveats
Some "thematic elements" may make it look like the game is broken, but it's by design. Specifically:

* Typing "check" at the obelisk yields `HESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESUNTHESU`.
* The death message spam is capitalized and concatenated on purpose, and so is the delay right before it.
