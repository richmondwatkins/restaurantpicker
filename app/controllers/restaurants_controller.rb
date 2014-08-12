class RestaurantsController

  def add
    puts "What is the name of the restaurant you would like to add?"
    name = clean_gets
    puts "What state is the restaurant located in?"
    state = clean_gets
    puts "What city?"
    city = clean_gets
    puts "What type of cuisine does this restaurant serve?"
    cuisine = clean_gets

    restaurant_name = Restaurant.create(name: name, state: state, city: city, cuisine: cuisine)
    if restaurant_name.new_record?
      puts training_path.errors.full_messages
    else
      puts "#{name} has been added to the list of restaurants. Would you like to add a review? If so submit "+ "(create)".colorize(:blue)+ ", if not sumbit "+ "(quit)".colorize(:red)
      reviews_controller = ReviewsController.new(restaurant_name)
      Router.navigate_review_menu(reviews_controller)
    end
  end


  def menu
    puts "\nIf you would like to add a restaurant to be reviewed, sumbit" + " (add).".colorize(:blue)
    puts "To read reviews or add a review to an existing restaurant submit" + " (view).".colorize(:red)
    puts "To see a list of reviews broken down by user submit" + " (user).".colorize(:yellow)
    Router.navigate_restaurant_review_menu(self)
  end

  def view
    restaurants.each_with_index do |restaurants, index|
      puts "#{index + 1}. #{restaurants.name} -#{restaurants.cuisine}- (#{restaurants.city}, #{restaurants.state})"
    end
    puts "\nEnter the number next to the restaurant to view it's details"
    show(clean_gets.to_i)
  end

  def show(id)
    restaurant = restaurants[id - 1]
    puts "#{restaurant.name} -#{restaurant.cuisine}- (#{restaurant.city}, #{restaurant.state})"
    reviews_controller = ReviewsController.new(restaurant)
    reviews_controller.list
  end

  def restaurants
    @restaurants ||= Restaurant.all
  end

end
