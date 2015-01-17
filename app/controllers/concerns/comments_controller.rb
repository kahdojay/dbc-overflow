class CommentsController < ApplicationController
  include AuthsHelper

  def index(commentable_id, commentable_type)
    @comments = Comment.where(commentable_id: commentable_id, commentable_type: commentable_type)
  end


end