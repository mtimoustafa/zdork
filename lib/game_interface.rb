require 'tty-prompt'
require 'pastel'

module GameInterface
  @@prompt = TTY::Prompt.new
  @@pastel = Pastel.new

  def self.print_title_screen
    title_text = 'ZDORK: THE LEGEND OF HYRULE RINGS OF POWER'
    help_text = <<~TEXT
      Choose an option with hjkl or the arrow keys, and select it with the Enter/Return key.
      If prompted for text, type it in the field and confirm with the Enter/Return key.
      Exit at any time with ctrl-c, or whatever your terminal uses to kill a process.
    TEXT

    @@prompt.say(@@pastel.green(title_text))
    self.narrate(description: help_text)
  end

  def self.enter_scene(description:, directions:)
    @@prompt.say(description)
    self.print_newline
    @@prompt.say(directions)

    return self.prompt_input
  end

  def self.converse(description:)
    @@prompt.say(description)
    return self.prompt_input
  end

  def self.narrate(description:)
    @@prompt.say(@@pastel.cyan(description))
  end

  def self.print_newline
    @@prompt.say("\n")
  end

  def self.prompt_input
    @@prompt.ask('> ', required: true)
  end
end
