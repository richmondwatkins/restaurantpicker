RSpec.describe "Adding new restaurants", :integration do
  context "valid input" do
    let!(:restaurant_1){ Restaurant.create(name: "Chipotle") }
    let!(:restaurant_2){ Restaurant.create(name: "McDonalds") }
    let!(:output){ run_rp_with_input("add", "BBQ Sam's", "Kansas", "Kansas City", "Mexican") }

    it "prints a success message" do
      expect(output).to include("BBQ Sam's has been added to the list of restaurants")
    end


    it "saves the correct restaurant to the record" do
      expect(Restaurant.first.id).to eq restaurant_1.id
    end

    it "saves the skill name" do
      expect(Restaurant.first.name).to eq "Chipotle"
    end
  end #end of context

end #end of RSPEC
