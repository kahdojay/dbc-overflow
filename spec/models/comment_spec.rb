require 'rails_helper'

describe Comment do
  it "has a valid factory" do
    expect(build(:q_comment)).to be_valid
  end

  it "is invalid without a body" do
    comment = build(:q_comment, body: nil)
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end

  it "is invalid without a user" do
    comment = build(:q_comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include("can't be blank")
  end

  it "has a valid factory" do
    expect(build(:a_comment)).to be_valid
  end

  it "is invalid without a body" do
    comment = build(:a_comment, body: nil)
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end

  it "is invalid without a user" do
    comment = build(:a_comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include("can't be blank")
  end


end