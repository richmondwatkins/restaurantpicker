RSpec.describe "FFD Main Menu", :integration do
  context "Prints a menu" do
    let(:output){ run_rp_with_input('remove') }
    it "prints an informative message" do
      expect(output).to include("I don't know the 'remove' command.")
    end
    it "should print the list of restaurants" do
        Restaurant.create(name: "Marry's Bakery", state: "Tennessee", city: "Nashville", cuisine: "American")
        Restaurant.create(name: "Steak n Shake", state: "New York", city: "Brentwood", cuisine: "Japanese")
        Restaurant.create(name: "What a Weiner", state: "Oklahoma", city: "Memphis", cuisine: "Indian")
        actual = run_rp_with_input("view")
        expected = "1. Marry's Bakery -American- (Nashville, Tennessee)\n" +
                   "2. Steak n Shake -Japanese- (Brentwood, New York)\n" +
                   "3. What a Weiner -Indian- (Memphis, Oklahoma)\n"
        expect(actual).to include(expected)
      end
    end


end
