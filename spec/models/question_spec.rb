require 'rails_helper'

describe Question do

  it "has a valid factory" do
    expect(build(:question)).to be_valid
  end

  it "is invalid without a title" do
    question = build(:question, title: nil)
    question.valid?
    expect(question.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
    question = build(:question, body: nil)
    question.valid?
    expect(question.errors[:body]).to include("can't be blank")
  end

  it "is invalid without a user" do
    question = build(:question, user_id: nil)
    question.valid?
    expect(question.errors[:user_id]).to include("can't be blank")
  end
end
