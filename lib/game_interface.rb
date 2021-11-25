require 'tty-prompt'
require 'pastel'

module GameInterface
  @@prompt = TTY::Prompt.new
  @@pastel = Pastel.new

  def self.print_title_screen
    title_text = 'ZDORK: THE LEGEND OF HYRULE RINGS OF POWER'
    help_text = <<~TEXT
      To make a choice, type one of the words written in ALL CAPS and press the Enter/Return key.
      Exit at any time by typing 'exit'.
    TEXT

    @@prompt.say(@@pastel.green(title_text))
    self.announce(description: help_text)
  end

  def self.converse(description:)
    self.narrate(description: description)
    return self.prompt_input
  end

  def self.announce(description:)
    @@prompt.say(@@pastel.cyan(description))
  end

  def self.narrate(description:)
    @@prompt.say(description)
    self.print_newline
  end

  def self.print_newline
    @@prompt.say("\n")
  end

  def self.prompt_input
    @@prompt.ask('> ', required: true)
  end
end
