class Personal::ExerciseSet < ActiveRecord::Base
  self.table_name = 'personal_exercise_sets'

  serialize :excluded_verbs_ids, Array
  serialize :included_verbs_ids, Array
  serialize :groups, Array
  serialize :tenses_ids, Array

  belongs_to :user
  has_many :user_repetitions, class_name: "UserRepetition", foreign_key: 'personal_exercise_set_id'

  def tenses
    ::Conjugation::Tense.where_in(id: tenses_ids)
  end

  def excluded_verbs
    ::Conjugation::Verb.where_in(id: excluded_verbs_ids)
  end

  def included_verbs
    ::Conjugation::Verb.where_in(id: included_verbs_ids)
  end
end
