module Personal
	class ExerciseSetsPresenter

		def tenses_list(exercise_set)
			exercise_set.tenses.map(&:label).join(", ")
		end

		def excluded_verbs_list(exercise_set)
			exercise_set.excluded_verbs.map(&:infinitive).join(", ")
		end

		def included_verbs_list(exercise_set)
			exercise_set.included_verbs.map(&:infinitive).join(", ")
		end

		def groups_list(exercise_set)
			exercise_set.groups.map{ |group| roman_map[group] }.join(", ")
		end

		private

		def roman_map
			{
				1 => "I",
				2 => "II",
				3 => "III",
			}
		end
	end
end