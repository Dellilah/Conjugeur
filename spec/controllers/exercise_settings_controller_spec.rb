require 'rails_helper'

describe ExerciseSettingsController do
  let(:form) { double(ExerciseSettingsForm, {}) }
  let(:exercise_settings_saver) { double(RandomExercises::SettingsSaver, settings: {}, session: session)}

  before(:each) do
    allow(ExerciseSettingsForm).to receive(:new).and_return(form)
  end

  it "Renders new settings form" do
    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("new")
  end

  context "with invalid form" do
    it "Renders new settings form again" do
      allow(form).to receive(:valid?).and_return(false)
      post :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("new")
    end
  end

  context "with valid form" do
    it "Redirects to exercise" do
      allow(form).to receive(:valid?).and_return(true)
      allow(form).to receive(:attributes).and_return({})
      expect(RandomExercises::SettingsSaver).to receive(:new).with({}, session).and_return(exercise_settings_saver)
      expect(exercise_settings_saver).to receive(:perform).and_return(true)
      post :create
      expect(response).to redirect_to('/losowe/cwiczenie/new')
      expect(response).to have_http_status(302)
    end
  end
end
