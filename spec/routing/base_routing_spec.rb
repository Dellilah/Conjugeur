require 'rails_helper'

describe "AppRouting" do
  specify {
    expect(get: "/").to route_to(controller: "main_page", action: "index")
  }
  specify {
    expect(get: "cwiczenie-losowe/new").to route_to(controller: "random_exercises", action: "new")
  }
  specify {
    expect(post: "cwiczenie-losowe").to route_to(controller: "random_exercises", action: "create")
  }
  specify {
    expect(get: "cwiczenie-losowe/cwicz").to route_to(controller: "random_exercises", action: "exercise")
  }
end
