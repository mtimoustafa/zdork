require_relative 'game_interface'
require_relative 'game_data/scenes'

class GameController
  attr_reader :current_scene, :current_event

  def initialize
    GameInterface.print_title_screen
    GameInterface.print_help_text
  end

  def start_game
    transition_scene(scene_name: GameController.starting_scene_name)
  end

  def process_player_command(player_command:)
    # Handle common commands
    return converse(description: @current_scene[:idle_event][:description]) if player_command == 'check'
    if player_command == 'help'
      GameInterface.print_help_text
      return GameInterface.prompt_input
    end

    # Handle incorrect commands
    unless @current_scene[:choices].keys.include?(player_command)
      GameInterface.print_bad_command
      return converse(description: @current_event[:description])
    end

    # Transition event and narrate it
    @current_event = @current_scene[:choices][player_command]
    GameInterface.narrate(description: @current_event[:description])

    # End game under the right conditions
    GameInterface.die(message: @current_event[:death_message]) if @current_event[:causes_death]
    GameInterface.win if @current_event[:causes_victory]

    # Transition scene if needed, otherwise keep command loop going
    if @current_event[:scene_transition].nil?
      return GameInterface.prompt_input
    end
    transition_scene(scene_name: @current_event[:scene_transition])
  end

  def self.starting_scene_name
    :desert
  end

  private

  def transition_scene(scene_name:)
    @current_scene = GameData.scenes[scene_name.to_sym]
    @current_event = @current_scene[:idle_event]

    return converse(description: @current_scene[:intro_description])
  end

  def converse(description:)
    GameInterface.narrate(description: description)
    player_command = GameInterface.prompt_input
  end
end
