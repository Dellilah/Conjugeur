require 'rails_helper'

describe Personal::ExerciseSetsController do

	let(:user) { build(:user) }

	before :each do
	  sign_in user
	end

  it "Renders index template" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("index")
  end
end
