require 'rails_helper'

RSpec.describe Entry, type: :model do
  fixtures :all
  subject {
    Entry.new(
      score: 12345,
      scored_at: DateTime.now,
      user_id: users(:user1).id,
      board_id: boards(:board1).id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without score" do
    subject.score = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without board_id and user_id" do
    subject.board_id = nil
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without board_id" do
    subject.board_id = nil
    expect(subject).to_not be_valid
  end
end
