require_relative 'game_interface'
require_relative 'game_data/scenes'

class GameController
  attr_reader :current_scene, :current_event

  def initialize
    start_new_game
  end

  private

  def start_new_game
    GameInterface.print_title_screen
    transition_scene(scene_name: :desert)
  end

  # TODO: make this not recurse so the stack doesn't overflow eventually
  def process_player_command(player_command:)
    filtered_command = filter_player_command(player_command: player_command)

    exit if filtered_command == 'exit'

    if filtered_command == 'check'
      player_command = GameInterface.converse(description: @current_event[:description])
      process_player_command(player_command: player_command)
    end

    if @current_scene[:choices].keys.include?(filtered_command)
      @current_event = @current_scene[:choices][filtered_command]

      GameInterface.print_newline
      GameInterface.narrate(description: @current_event[:description])

      transition_scene(scene_name: @current_event[:scene_transition]) unless @current_event[:scene_transition].nil?
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
