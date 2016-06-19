class ExerciseForm < BaseForm
  attribute :form_id, Integer
  attribute :answer, String
  attribute :user_repetition_id, Integer

  validates :form_id, presence: true
end
