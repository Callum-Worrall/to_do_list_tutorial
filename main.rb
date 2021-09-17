require_relative "UserInterface.rb"
require_relative "List.rb"

ui = UserInterface.new
list = List.new()

ui.main_menu(list)