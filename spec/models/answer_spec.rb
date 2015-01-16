require 'rails_helper'

describe Answer do
  it "is valid with a body" do
    answer = Answer.new(
      body: "If you go into your config file, you'll find the answer"
      )
    expect(answer).to be_valid
  end

  it "is invalid without a body" do
    answer = Answer.new(
      body: nil
      )
    answer.valid?
    expect(answer.errors[:body]).to include("can't be blank")
  end
end
