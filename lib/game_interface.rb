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
    @@prompt.say(@@pastel.cyan(help_text))
  end
end
