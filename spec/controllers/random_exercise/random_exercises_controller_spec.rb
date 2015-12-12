require 'rails_helper'

describe RandomExercise::RandomExercisesController do
  let(:context) { double(ExerciseContext, params: {}, session: {}) }
  let(:form) { double(ExerciseForm, {}) }

  before(:each) do
    allow(ExerciseForm).to receive(:new).and_return(form)
    allow(form).to receive(:attributes).and_return({})
  end

  describe "#new" do
    it "creates new exercise context and renders form" do
      expect(ExerciseContext).to receive(:new).and_return(context)
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("new")
    end
  end

  it "checks an answer, returns the result and draw new exercise" do
    allow(CheckAnswer).to receive(:perform).with({}).and_return({ result: true, correct: 'aimes' })
    post :check
    expect(response).to redirect_to('/losowe/cwiczenie/new')
    expect(response).to have_http_status(302)
    expect(flash[:notice]).to match("Poprawna odpowiedź!")
  end

  it "checks an answer, returns the result and draw new exercise" do
    allow(CheckAnswer).to receive(:perform).with({}).and_return({ result: false, correct: 'aimes' })
    post :check
    expect(response).to redirect_to('/losowe/cwiczenie/new')
    expect(response).to have_http_status(302)
    expect(flash[:error]).to match("Błędna odpowiedź. Poprawna: aimes")
  end
end
