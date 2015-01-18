class QuestionsController < ApplicationController
  include AuthsHelper

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def search
    @questions = Question.search(params[:q])
    render 'index'
  end

  def new
  end

  def show
    @question = Question.find(params[:id])
    @new_answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
    @question.create_tags(params[:question][:tags]) if params[:question][:tags]
      redirect_to question_path(@question)
    else
      flash[:alert] = "ERROR: #{@question.errors.full_messages.join("; ")}"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    redirect_to root_path unless @question.user_id == current_user.id
  end

  def update
    @question = Question.find(params[:id])
    redirect_to root_path unless @question.user_id == current_user.id
    if @question.update(question_params)
      redirect_to @question
    else
      flash[:alert] = "ERROR: #{@question.errors.full_messages.join("; ")}"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    redirect_to root_path unless @question.user_id == current_user.id || current_user.is_admin
    @question.destroy
    redirect_to root_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end
