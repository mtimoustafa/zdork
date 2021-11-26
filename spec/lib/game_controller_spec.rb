require_relative '../../lib/game_controller'

describe GameController do
  let(:game_controller) { GameController.new }
  let(:command) { 'command' }
  let(:events) do
    {
      "#{GameController.starting_scene_name}_idle": {
        description: 'Grues are no joke'
      },
      meet_grue: {
        scene_transition: :grue,
        description: 'Grues are no joke'
      },
      no_grue: {
        description: 'Good job'
      },
      grue_idle: {
        description: ''
      },
      grue_fight: {
        causes_death: true,
        death_message: 'RIP',
        description: ''
      },
      grue_run: {
        causes_victory: true,
        description: ''
      }
    }
  end

  let(:scenes) do
    {
      "#{GameController.starting_scene_name}": {
        intro_description: 'Don\'t find the grue',
        idle_event: events[:"#{GameController.starting_scene_name}_idle"],
        choices: {
          'grue' => events[:meet_grue],
          'no grue' => events[:no_grue]
        }
      },
      grue: {
        intro_description: '',
        idle_event: events[:grue_idle],
        choices: {
          'fight' => events[:grue_fight],
          'run' => events[:grue_run]
        }
      }
    }
  end

  before(:each) do
    allow(GameInterface).to receive(:print_title_screen)
    allow(GameInterface).to receive(:print_help_text)
  end

  context '#initialize' do
    it 'prints title screen' do
      expect(GameInterface).to receive(:print_title_screen).exactly(1).times
      game_controller
    end
    it 'prints title screen' do
      expect(GameInterface).to receive(:print_help_text).exactly(1).times
      game_controller
    end
  end

  context '#start_game' do
    before(:each) do
      allow(GameData).to receive(:events).and_return(events)
      allow(GameData).to receive(:scenes).and_return(scenes)

      allow(GameInterface).to receive(:prompt_input).and_return(command)
      allow(GameInterface).to receive(:narrate)
    end

    it 'sets the correct scene' do
      game_controller.start_game

      expected_scene = scenes[:"#{GameController.starting_scene_name}"]
      expect(game_controller.current_scene).to be(expected_scene)
    end

    it 'sets the correct event' do
      game_controller.start_game

      expected_event = events[:"#{GameController.starting_scene_name}_idle"]
      expect(game_controller.current_event).to be(expected_event)
    end

    it 'sets the event to the first scene\'s idle event' do
      game_controller.start_game

      expected_event = scenes[GameController.starting_scene_name][:idle_event]
      expect(game_controller.current_event).to be(expected_event)
    end

    it 'returns a player command' do
      expect(GameInterface).to receive(:prompt_input).exactly(1).times
      expect(game_controller.start_game).to equal(command)
    end
  end

  context '#process_player_command' do
    before(:each) do
      allow(GameData).to receive(:events).and_return(events)
      allow(GameData).to receive(:scenes).and_return(scenes)

      allow(GameInterface).to receive(:prompt_input).and_return(command)
      allow(GameInterface).to receive(:narrate)

      game_controller.start_game
    end

    it 'transitions events with a narration on a valid command' do
      game_controller.process_player_command('no grue')

      expect(game_controller.current_scene).to be(scenes[:"#{GameController.starting_scene_name}"])
      expect(game_controller.current_event).to be(events[:no_grue])
    end

    it 'transitions scene if event calls for it' do
      game_controller.process_player_command('grue')

      expect(game_controller.current_scene).to be(scenes[:grue])
      expect(game_controller.current_event).to be(events[:grue_idle])
    end

    it 'triggers game loss if event causes it' do
      expect(GameInterface).to receive(:die).exactly(1).times.with(message: events[:grue_fight][:death_message])

      game_controller.process_player_command('grue')
      game_controller.process_player_command('fight')
    end

    it 'triggers game victory if event causes it' do
      expect(GameInterface).to receive(:win).exactly(1).times

      game_controller.process_player_command('grue')
      game_controller.process_player_command('run')
    end

    it 'narrates scene\'s idle event description on "check" command' do
      expect(GameInterface).to receive(:narrate).exactly(1).times.with(events[:"#{GameController.starting_scene_name}_idle"][:description])
      game_controller.process_player_command('check')
    end

    it 'announces help text on "help" command' do
      expect(GameInterface).to receive(:print_help_text).exactly(1).times
      game_controller.process_player_command('help')
    end

    it 'prints an error on a bad command' do
      expect(GameInterface).to receive(:print_bad_command).exactly(1).times
      game_controller.process_player_command('oopsie')
    end
  end

  context '.starting_scene_name' do
    it 'returns a symbol' do
      expect(GameController.starting_scene_name).to be_kind_of(Symbol)
    end
  end
end
