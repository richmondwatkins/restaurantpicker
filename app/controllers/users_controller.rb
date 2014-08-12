class UsersController

  def list
    users.each_with_index do |user, index|
      puts "#{index +1}. #{user.name}"
      user = users[index]
      puts "-Total Reviews: #{user.reviews.length}"
    end
      puts "\nEnter the number of the user you would like to see the details of."
      show(clean_gets.to_i)
  end

  def show(id)
    user = users[id - 1]


    user.reviews.each_with_index do |review, index|
      output = ""
      for i in 0..(review.review - 1)
        output << "\u2606\s".colorize(:yellow)
      end
      puts "------------------------"
      puts"#{review.restaurant.name}"
      puts "#{review.created_time}"
      puts "#{output}"
      puts"#{review.description}"
      puts "------------------------"
    end
  end


  def users
    @users ||= User.all
  end

  def users_reviews
    @usrs_reviews ||= @user.reviews
  end

end
