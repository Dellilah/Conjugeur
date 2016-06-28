FactoryGirl.define do
  factory :empty_exercise_set, class: Personal::ExerciseSet do
    tenses_ids []
    excluded_verbs_ids []
    included_verbs_ids []
    groups []
  end

  factory :personal_exercise_set, class: Personal::ExerciseSet do
    tenses_ids [1, 3]
    excluded_verbs_ids []
    included_verbs_ids []
    groups [1, 2, 3]
  end
end
