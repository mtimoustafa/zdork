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

    @current_scene = GameData::SCENES[:desert]
    @current_event = @current_scene[:idle_event]

    player_command = GameInterface.enter_scene(
      description: @current_scene[:description],
      directions:  @current_event[:description]
    )
    process_player_command(player_command: player_command)
  end

  def process_player_command(player_command:)
    puts player_command
  end
end
