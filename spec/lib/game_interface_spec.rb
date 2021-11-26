require_relative '../../lib/game_interface'
require 'tty-prompt'

describe GameInterface do
  context '.print_title_screen' do
    it 'prints the title screen' do
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{GameInterface.title_text}/)
      GameInterface.print_title_screen
    end
  end

  context '.print_help_text' do
    it 'prints the help text' do
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{GameInterface.help_text}/)
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with("\n")
      GameInterface.print_help_text
    end
  end

  context '.print_bad_commmand' do
    it 'prints an error' do
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{GameInterface.error_text}/)
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with("\n")
      GameInterface.print_bad_command
    end
  end

  context '.announce' do
    it 'outputs text with the right formatting' do
      text = 'asdf'
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{text}/)
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with("\n")
      GameInterface.announce(description: text)
    end
  end

  context '.narrate' do
    it 'outputs text with the right formatting' do
      text = 'asdf'
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{text}/)
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with("\n")
      GameInterface.narrate(description: text)
    end
  end

  context '.print_newline' do
    it 'outputs an empty new line' do
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with("\n")
      GameInterface.print_newline
    end
  end

  context '.prompt_input' do
    before(:each) do
      allow_any_instance_of(TTY::Prompt).to receive(:say)
    end

    it 'calls the appropriate prompt command with the right formatting' do
      expect_any_instance_of(TTY::Prompt).to receive(:ask).exactly(1).times.with('> ', required: true).and_return('command')
      GameInterface.prompt_input
    end

    it 'returns user input' do
      command = 'command'
      allow_any_instance_of(TTY::Prompt).to receive(:ask).with('> ', required: true).and_return(command)
      expect(GameInterface.prompt_input).to eq(command)
    end
  end

  context '.die' do
    it 'outputs the correct death message' do
      allow(GameInterface).to receive(:sleep)

      death_message = 'rip'
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with('...')
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{death_message.upcase}\d{1000}/)
      # This message duplicates only in testing, for some reason :/
      expect_any_instance_of(TTY::Prompt).to receive(:say).with(/#{GameInterface.death_text}/)

      GameInterface.die(message: death_message)
    end
  end

  context '.win' do
    it 'outputs the correct victory message' do
      allow(GameInterface).to receive(:sleep)

      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with('...')
      expect_any_instance_of(TTY::Prompt).to receive(:say).exactly(1).times.with(/#{GameInterface.win_text}/)

      GameInterface.win
    end
  end
end
