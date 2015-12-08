require 'rails_helper'

describe MainPageController do
  it "Renders main template" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("index")
  end
end
