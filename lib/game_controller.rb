require_relative 'game_interface'

class GameController
  def initialize
    start_new
  end

  private

  def start_new
    GameInterface.print_title_screen
  end
end
