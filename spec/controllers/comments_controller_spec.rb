require "rails_helper"

describe CommentsController do
  describe 'GET #index' do
    it 'populates an array of all comment to a question' do
      comment1 = create(:q_comment)
      comment2 = create(:q_comment)
      get :index, commentable_id: 1, commentable_type: "Question"
      expect(assigns(:q_comment)).to match_array([comment1, comment2])
    end
    it 'populates an array of all comment to an answer' do
      comment1 = create(:a_comment)
      comment2 = create(:a_comment)
      get :index, commentable_id: 1, commentable_type: "Answer"
      expect(assigns(:q_question)).to match_array([comment1, comment2])
    end

  end

  describe 'GET #show' do

  end

  describe 'GET #new' do

  end

  describe 'GET #edit' do
  end

  describe 'POST #create' do

  end
end