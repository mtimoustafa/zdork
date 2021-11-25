require_relative 'game_interface'
require_relative 'game_data/scenes'

class GameController
  def initialize
    @current_scene = GameData::SCENES[:desert]
    start_new
  end

  private

  def start_new
    GameInterface.print_title_screen
    GameInterface.enter_scene(description: @current_scene[:description], directions: @current_scene[:directions])
  end
end
