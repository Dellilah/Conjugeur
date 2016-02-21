class ExerciseSettingsForm < BaseForm
  attribute :tenses, Array[Integer]
  attribute :groups, Array[Integer]
  attribute :excluded_verbs, Array[Integer]
  attribute :included_verbs, Array[Integer]

  validates :tenses, presence: true

  validate :tenses_exist?
  validate :verbs_exist?

  def verbs_exist?
    errors.add(:groups, :no_verbs) unless ::VerbsAvailablePolicy.new(groups, excluded_verbs, included_verbs).applies?
  end

  def tenses_exist?
    errors.add(:tenses, :invalid) unless (tenses-Conjugation::Tense.all.map(&:id)).empty?
  end
end
