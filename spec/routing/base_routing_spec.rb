require 'rails_helper'

describe "AppRouting" do
  specify {
    expect(get: "/").to route_to(controller: "main_page", action: "index")
  }
  specify {
    expect(get: "kryteria/new").to route_to(controller: "exercise_settings", action: "new")
  }
  specify {
    expect(post: "kryteria").to route_to(controller: "exercise_settings", action: "create")
  }
  specify {
    expect(get: "losowe/cwiczenie/new").to route_to(controller: "random_exercise/random_exercises", action: "new")
  }
  specify {
    expect(post: "losowe/cwiczenie/sprawdz").to route_to(controller: "random_exercise/random_exercises", action: "check")
  }
end
