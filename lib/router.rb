class Router

  def self.navigate_restaurant_review_menu(restaurant_controller)
    command = clean_gets
    case command
    when "add"
      restaurant_controller.add
    when "user"
      user_controller = UsersController.new()
      user_controller.list
    when "view"
      restaurant_controller.view
    when "back"
      restaurant_controller = RestaurantsController.new()
      restaurant_controller.menu
    when "quit"
      puts "Thanks for your time!"
    when ""
      puts "Can not accept a blank input."
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_review_menu(reviews_controller)
    command = clean_gets
    case command
    when "create"
      reviews_controller.add
    when "back"
      restaurant_controller = RestaurantsController.new()
      restaurant_controller.menu
    when "quit"
      puts "Thanks for your time!"
    else
      puts "I don't know the '#{command}' command."
    end
  end

end


# class Router
#   def self.navigate_skills_menu(skills_controller)
#     command = clean_gets
#     case command
#     when "add"
#       skills_controller.add
#     when /\d+/
#       skills_controller.view(command.to_i)
#     else
#       puts "I don't know the '#{command}' command."
#     end
#   end
#
#   def self.navigate_training_paths_menu(training_paths_controller)
#     command = clean_gets
#
#     case command
#     when "add"
#       training_paths_controller.add
#     when /\d+/
#       training_paths_controller.view(command.to_i)
#     else
#       puts "I don't know the '#{command}' command."
#     end
#   end
# end
