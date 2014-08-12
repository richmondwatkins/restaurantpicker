RSpec.describe "Adding new restaurants", :integration do
  context "valid input" do
    let!(:restaurant_1){ Restaurant.create(name: "Chipotle") }
    let!(:restaurant_2){ Restaurant.create(name: "McDonalds") }
    let!(:review_1) { Review.create(description: "this is the descp", review: "5", restaurant_id: restaurant_1.id, reviewer_name: "Billy" )}
    let!(:output){ run_rp_with_input("view", "1", "create", "Richmond", "3", "Had a great time!") }

    it "saves the review" do
      expect(output).to include("Your review has been saved.")
    end


    it "saves the review to the correct restaurant" do
      expect(Restaurant.first.id).to eq restaurant_1.id
    end

    it "saves the skill name" do
      expect(review_1.restaurant_id).to eq restaurant_1.id
    end
  end #end of context

end #end of RSPEC
