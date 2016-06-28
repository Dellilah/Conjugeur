FactoryGirl.define do
  factory :user_repetition, class: UserRepetition do
    easiness_factor 2.5
    number_repetitions 0
    association :user
    personal_exercise_set_id 1
  end
end
