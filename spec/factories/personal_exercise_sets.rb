FactoryGirl.define do
  factory :empty_exercise_set, class: Personal::ExerciseSet do
    tenses_ids []
    excluded_verbs_ids []
    included_verbs_ids []
    groups []
  end
end
