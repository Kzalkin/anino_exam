require 'rails_helper'

RSpec.describe Board, type: :model do
  subject{
    Board.new(name: "Testing")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
