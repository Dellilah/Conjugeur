class User::ExerciseSet < ActiveRecord::Base
	self.table_name = 'user_exercise_sets'

	serialize :excluded_verbs, Array
	serialize :included_verbs, Array
	serialize :groups, Array
	serialize :tenses, Array

	belongs_to :user
end
