require_relative 'game_interface'
require_relative 'game_data/scenes'

class GameController
  attr_reader :current_scene, :current_event

  def initialize
    GameInterface.print_title_screen
    transition_scene(scene_name: :desert)
  end

  private

  # TODO: make this not recurse so the stack doesn't overflow eventually
  def process_player_command(player_command:)
    filtered_command = filter_player_command(player_command: player_command)

    exit if filtered_command == 'exit'

    if filtered_command == 'help'
      GameInterface.print_help_text
      player_command = GameInterface.prompt_input
      process_player_command(player_command: player_command)
    end

    if filtered_command == 'check'
      player_command = GameInterface.converse(description: @current_scene[:idle_event][:description])
      process_player_command(player_command: player_command)
    end

    if @current_scene[:choices].keys.include?(filtered_command)
      @current_event = @current_scene[:choices][filtered_command]

      GameInterface.narrate(description: @current_event[:description])

      GameInterface.die(message: @current_event[:death_message]) if @current_event[:causes_death]
      GameInterface.win if @current_event[:causes_victory]

      if @current_event[:scene_transition].nil?
        player_command = GameInterface.prompt_input
        process_player_command(player_command: player_command)
      else
        transition_scene(scene_name: @current_event[:scene_transition])
      end
    else
      GameInterface.announce(description: "Sorry, you cannot do that.\n")

      player_command = GameInterface.converse(description: @current_event[:description])
      process_player_command(player_command: player_command)
    end
  end

  def transition_scene(scene_name:)
    @current_scene = GameData::SCENES[scene_name.to_sym]
    @current_event = @current_scene[:idle_event]

    player_command = GameInterface.converse(description: @current_scene[:intro_description])
    process_player_command(player_command: player_command)
  end

  def filter_player_command(player_command:)
    player_command.strip.downcase
  end
end
