require 'rails_helper'

describe RandomExercisesController do
  it "Renders new settings form" do
    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("new")
  end
end
