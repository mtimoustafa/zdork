require 'tty-prompt'
require 'pastel'

module GameInterface
  def self.print_title_screen
    self.prompt.say(pastel.green(self.title_text))
  end

  def self.print_help_text
    self.announce(self.help_text)
  end

  def self.print_bad_command
    self.announce(self.error_text)
  end

  def self.announce(message)
    prompt.say(pastel.cyan(message))
    self.print_newline
  end

  def self.narrate(message)
    prompt.say(message)
    self.print_newline
  end

  def self.print_newline
    prompt.say("\n")
  end

  def self.prompt_input
    response = prompt.ask('> ', required: true)

    GameInterface.print_newline
    return response.strip.downcase
  end

  def self.die(message:)
    prompt.say('...')
    sleep 5

    # I'm sorry
    spoopy_death_message_spam = 1000.times.collect { message.upcase }.join
    prompt.say(pastel.magenta(spoopy_death_message_spam))

    sleep 1
    prompt.say(pastel.red(self.death_text))

    exit
  end

  def self.win
    prompt.say('...')
    sleep 5
    prompt.say(pastel.green(self.win_text))
    exit
  end

  private

  def self.title_text
    <<~TEXT
    ===================================
      ___________   ____  _____  _  __
     |___  /  __ \\ / __ \\|  __ \\| |/ /
        / /| |  | | |  | | |__) | ' /
       / / | |  | | |  | |  _  /|  <
      / /__| |__| | |__| | | \\ \\| . \\
     /_____|_____/ \\____/|_|  \\_\\_|\\_\\

    ======= A SPOOPY ZORK CLONE =======
    TEXT
  end

  def self.help_text
    <<~TEXT
       To make a choice, type one of the words written in all-caps and press the Enter/Return key.
       Type CHECK to see what's around you.
       Type HELP to see these instructions again.
       Exit at any time by typing EXIT.
     TEXT
  end

  def self.error_text
    "Sorry, you cannot do that.\n"
  end

  def self.death_text
    '[ Y O U  D I E D ]'
  end

  def self.win_text
    '[ V I C T O R Y  A C H I E V E D ]'
  end

  def self.prompt
    @prompt ||= TTY::Prompt.new
  end

  def self.pastel
    @pastel ||= Pastel.new
  end
end
