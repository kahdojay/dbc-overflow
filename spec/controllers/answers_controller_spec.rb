require 'spec_helper'
require 'rails_helper'

describe AnswersController do


  describe 'GET #show' do

    it 'renders the :answer#show template' do
      question = create(:question)
      answer = create(:answer, question: question)
      get :show, id: question, question_id: question.id
      expect(response).to render_template :show
    end
  end

end