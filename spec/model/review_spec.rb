RSpec.describe Review do
  it { should belong_to :user }
  it { should belong_to :restaurant}
end
