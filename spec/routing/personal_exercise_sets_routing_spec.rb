require 'rails_helper'

describe "PersonalExerciseSetsRouting" do
  specify {
    expect(get: "zestawy-cwiczeniowe/").to route_to(controller: "personal/exercise_sets", action: "index")
  }
end
