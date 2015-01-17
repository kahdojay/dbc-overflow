require "rails_helper"

describe CommentsController do
  describe 'POST #create' do
    it 'adds a comment to the comments table'
    it 'does not save a comment without a body'
  end

  describe 'GET #edit' do
    it 'renders an edit form with original body text'
  end

  describe 'PUT #update' do
    it 'updates the comment in the comments table'
    it 'does not update a comment without a body'
  end

  describe 'DELETE #destroy' do
    it 'deletes the comment from the comments table'
    it 're-renders the same page after delete'
  end
end