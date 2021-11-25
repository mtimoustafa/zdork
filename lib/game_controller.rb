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
    filtered_command = filter_player_command(player_command: player_command)

    if filtered_command == 'check'
      player_command = GameInterface.converse(description: @current_event[:description])
      process_player_command(player_command: player_command)
    end

    puts @current_scene[:choices]
    if @current_scene[:choices].keys.include?(filtered_command)
      # TODO
    else
      GameInterface.narrate(description: "Sorry, you cannot do that.\n")
      player_command = GameInterface.converse(description: @current_event[:description])
      process_player_command(player_command: player_command)
    end
  end

  private

  def filter_player_command(player_command:)
    player_command.strip.downcase
  end
end
