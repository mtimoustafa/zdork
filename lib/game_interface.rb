require 'tty-prompt'
require 'pastel'

module GameInterface
  @@prompt = TTY::Prompt.new
  @@pastel = Pastel.new

  def self.print_title_screen
    @@prompt.say(@@pastel.green('ZDORK: THE LEGEND OF HYRULE RINGS OF POWER'))
  end

  def self.print_help_text
    self.announce(
      description: <<~TEXT
                     To make a choice, type one of the words written in all-caps and press the Enter/Return key.
                     Type CHECK to see what's around you.
                     Type HELP to see these instructions again.
                     Exit at any time by typing EXIT.
                   TEXT
    )
  end

  def self.print_bad_command
    self.announce(description: "Sorry, you cannot do that.\n")
  end

  def self.announce(description:)
    @@prompt.say(@@pastel.cyan(description))
    self.print_newline
  end

  def self.narrate(description:)
    @@prompt.say(description)
    self.print_newline
  end

  def self.print_newline
    @@prompt.say("\n")
  end

  def self.prompt_input
    response = @@prompt.ask('> ', required: true)

    GameInterface.print_newline
    return response.strip.downcase
  end

  def self.die(message:)
    @@prompt.say('...')
    sleep 5

    # I'm sorry
    spoopy_death_message_spam = 1000.times.collect { message.upcase }.join
    @@prompt.say(@@pastel.magenta(spoopy_death_message_spam))

    sleep 1
    @@prompt.say(@@pastel.red('[ Y O U  D I E D ]'))

    exit
  end

  def self.win
    @@prompt.say('...')
    sleep 5
    @@prompt.say(@@pastel.green('[ V I C T O R Y  A C H I E V E D ]'))
    exit
  end
end
