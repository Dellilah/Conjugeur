require 'rails_helper'

describe Personal::ExerciseSetsController do

	let(:user) { build(:user) }
  let(:context) { double(Personal::ExerciseSetsContext) }

	before :each do
	  sign_in user
    allow(Personal::ExerciseSetsContext).to receive(:new).and_return(context)
	end

	it "Renders index template" do
		get :index
		expect(response).to be_success
		expect(response).to have_http_status(200)
		expect(response).to render_template("index")
	end

	it "Renders form template" do
		get :new
		expect(response).to be_success
		expect(response).to have_http_status(200)
		expect(response).to render_template("new")
	end

	context "When form is invalid" do
		before :each do
			allow(context).to receive_message_chain(:form, :valid?) { false }
		end

		it "redirects to exericse sets index" do
			post :create
			expect(response).to have_http_status(200)
			expect(response).to render_template("new")
		end
	end

	context "When form is valid" do
		before :each do
			allow(context).to receive_message_chain(:form, :valid?) { true }
			allow(context).to receive_message_chain(:form, :attributes) { {} }
			allow(::Personal::ExerciseSetSaver).to receive(:perform).and_return(true)
		end

		it "redirects to exericse sets index" do
			post :create
			expect(response).to have_http_status(302)
			expect(subject).to redirect_to(exercise_sets_path)
		end
	end
end
