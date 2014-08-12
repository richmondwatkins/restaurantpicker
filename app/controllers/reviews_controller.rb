class ReviewsController

  def initialize(origin_restaurant)
      @origin_restaurant = origin_restaurant
  end

  def add
    puts "What name would like this review to be under?"
    reviewer_name = clean_gets
    puts "Enter a number 1-5 as a rating for this restaurant"
    review = clean_gets
    puts "Enter up to 200 characters to describe your experience"
    description = clean_gets
    created_time = Time.now

    user_name = User.find_or_create_by( name: reviewer_name )

    review = Review.create(user_id: user_name.id, created_time: created_time, reviewer_name: reviewer_name, description: description, review: review, restaurant_id: @origin_restaurant.id)

    if review.new_record?
      puts review.errors.full_messages
    else
      puts "Your review has been saved."
    end
  end

  def list
    puts "============================="
    puts "#{@origin_restaurant.name.upcase} REVIEWS"
    puts "============================="
    # review = reviews
    if (reviews.length > 0)
      reviews.each_with_index do |review, index|
        output = ""

        for i in 0..(review.review - 1)
          output << "\u2606\s".colorize(:yellow)
        end

        output << "\n#{review.description}"
        puts "--------------------------"
        puts review.created_time
        puts output
        puts "-#{review.reviewer_name}"
        puts "--------------------------"
      end
    else
      puts "This restaurant has not been reviewed. You can be the first!"
    end
    puts "\nEnter " + "(create)".colorize(:blue) + " to open the create a review prompt."
    Router.navigate_review_menu(self)
  end


  def reviews
    @reviews ||= @origin_restaurant.reviews
  end






end
