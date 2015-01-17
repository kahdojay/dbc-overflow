require "rails_helper"

describe QuestionsController do
  before :each do
    @user = create(:user)
    @user.questions << create(:question)
    @question = @user.questions.last
    session[:id] = @question.user_id
  end

  describe 'GET #show' do
    it "assigns the requested question to @question" do
      get :show, id: @question
      expect(assigns(:question)).to eq @question
    end

    it "renders the #show template" do
      get :show, id: @question
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested question to @question" do
      get :edit, id: @question.id
      expect(assigns(:question)).to eq @question
    end

    it "renders the #edit template" do
      get :edit, id: @question.id
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new question in the database" do
        expect {
          post :create, question: attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects to questions#show" do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns[:question])
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, question: attributes_for(:invalid_question)
        }.not_to change(Question, :count)
      end

      it "re-renders the #new template" do
        post :create, question: attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = create(:user)
      @user.questions << create(:question, body: "this is the body")
      @question = @user.questions.last
      session[:id] = @question.user_id
    end

    context "with valid attributes" do
      it "locates the requested question" do
        patch :update, id: @question, question: attributes_for(:question)
        expect(assigns(:question)).to eq(@question)
      end

      it "changes @questions attributes" do
        patch :update, id: @question, question: attributes_for(:question,
          body: "different!",
          title: "Django")
        @question.reload
        expect(@question.body).to eq("different!")
        expect(@question.title).to eq("Django")
      end

      it "redirects to the updated question" do
        patch :update, id: @question, question: attributes_for(:question)
        expect(response).to redirect_to @question
      end

      context "with invalid attributes" do
        it "does not change the attributes" do
          patch :update, id: @question, question: attributes_for(:question, body: nil, title: "Bazinga")
          @question.reload
          expect(@question.title).not_to eq("Bazinga")
          expect(@question.body).to eq("this is the body")
        end

        it "re-renders the :edit template" do
          patch :update, id: @question, question: attributes_for(:invalid_question)
          expect(response).to render_template :edit
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the question from the database" do
      expect{
      delete :destroy, id: @question
      }.to change(Question, :count).by(-1)
    end

    it "renders the :index template" do
      delete :destroy, id: @question.id
      expect(response).to redirect_to root_path
    end
  end

end
