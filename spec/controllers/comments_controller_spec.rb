require "rails_helper"

describe CommentsController do
  describe 'POST #create' do
    it 'adds a comment to the comments table' do
      expect{
        create(:q_comment)
        }.to change(Comment, :count).by(1)
    end

    it 'does not save a comment without a body' do
      @question = create(:question, id: 1)
      expect{
        post :create, comment: attributes_for(:invalid_comment, commentable_id: 1, commentable_type: 'Question')
        }.to change(Comment, :count).by(0)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested comment to @comment' do
      comment = create(:q_comment)
      get :edit, id: comment.id
      expect(assigns(:comment)).to eq(comment)
    end

    it 'renders an edit form with original body text' do
      comment = create(:q_comment)
      get :edit, id: comment.id
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before :each do
      @question = create(:question, id: 1)
      @comment = create(:q_comment)
    end

    it 'updates the comment in the comments table' do
      patch :update, id: @comment, comment: attributes_for(:comment, body: "different!")
      @comment.reload
      expect(@comment.body).to eq("different!")
    end
  end
end