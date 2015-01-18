require 'spec_helper'
require 'rails_helper'

describe AnswersController do

  describe '# show' do
    it 'renders the answer#show template' do
      question = create(:question)
      answer = create(:answer, question: question)
      get :show, id: question, question_id: question.id
      expect(response).to render_template :show
    end
  end

  describe '# create' do
    before :each do
      @question = create(:question, id: 1)
      @answer = create(:answer, question: @question)
    end

    context "with valid attributes" do
      it "saves the new answer in the database" do
        expect {
          post :create, question_id: @question.id, answer: attributes_for(:answer)
        }.to change(Answer, :count).by(1)
      end

      it "redirects to answers#show" do
        post :create, question_id: @question.id, answer: attributes_for(:answer)
        expect(response).to redirect_to question_path(@question)
      end
    end
    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, question_id: @question.id, answer: attributes_for(:invalid_answer)
        }.not_to change(Answer, :count)
      end
      it "re-renders the #new template" do
        post :create, question_id: @question.id, answer: attributes_for(:invalid_answer)
        expect(response).to redirect_to question_path(@question)
      end
    end
  end

  context 'edit/update' do
    before :each do
      @user = create(:user, id: 1)
      @question = create(:question, id: 1)
      @answer = create(:answer)
      session[:id] = @answer.user_id
    end

    describe '# edit' do
      it "assigns the requested answer to @answer" do
        get :edit, question_id: @question.id, id: @answer.id
        expect(assigns(:answer)).to eq @answer
      end

      it "renders the #edit template" do
        get :edit, question_id: @question.id, id: @answer.id
        expect(response).to render_template :edit
      end
    end

    describe '# update' do
      it 'updates the answer in the answers table' do
        patch :update, question_id: @question.id, id: @answer, answer: attributes_for(:answer, body: "different!")
        @answer.reload
        expect(@answer.body).to eq("different!")
      end
    end

    describe '# destroy' do
      it "deletes the question from the database" do
        expect{
        delete :destroy, question_id: @question.id, id: @answer
        }.to change(Answer, :count).by(-1)
      end

      it "renders the :index template" do
        delete :destroy, question_id: @question.id, id: @answer.id
        expect(response).to redirect_to question_path(@question)
      end
    end
  end

end