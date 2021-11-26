require_relative 'lib/game_controller'

game_controller = GameController.new
player_command = game_controller.start_game

while player_command != 'exit'
  player_command = game_controller.process_player_command(player_command)
end
