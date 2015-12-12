class ExerciseForm < BaseForm
  attribute :form_id, Integer
  attribute :answer, String
  attribute :user_group_id, Integer

  validates :form_id, presence: true
end
