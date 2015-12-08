class ExerciseSettingsForm < BaseForm
  attribute :tenses, Array[Integer]
  attribute :groups, Array[Integer]
  attribute :excluded_verbs, String
  attribute :included_verbs, String

  validates :tenses, presence: true
  validates :groups, presence: true
  validates :excluded_verbs, format: { with: /\A([a-zA-Z]*)(\,\s*[a-zA-Z]+)*\z/ }
  validates :included_verbs, format: { with: /\A([a-zA-Z]*)(\,\s*[a-zA-Z]+)*\z/ }

  validate :tenses_exist?
  validate :groups_exist?

  def groups_exist?
    errors.add(:groups, :invalid) unless (groups-(1..3).to_a).empty?
  end

  def tenses_exist?
    errors.add(:tenses, :invalid) unless (tenses-Conjugation::Tense.all.map(&:id)).empty?
  end
end
