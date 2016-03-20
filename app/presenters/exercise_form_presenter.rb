class ExerciseFormPresenter
	def initialize(params)
		@params = params
	end

	def included_verbs
		Conjugation::Verb.where_in(id: included_verbs_ids.map(&:to_i)) if included_verbs_ids
	end

	def excluded_verbs
		Conjugation::Verb.where_in(id: excluded_verbs_ids.map(&:to_i)) if excluded_verbs_ids
	end

	def partial
		excluded_verbs ? "excluded_verbs" : "included_verbs"
	end

	def js_class
		excluded_verbs ? ".x-excluded-verbs-container" : ".x-included-verbs-container"
	end

	private

	attr_reader :params

	def excluded_verbs_ids
		excluded.try(:split, " ")
	end

	def included_verbs_ids
		included.try(:split, " ")
	end

	def excluded
		params.fetch(:excluded_verbs, nil)
	end

	def included
		params.fetch(:included_verbs, nil)
	end
end