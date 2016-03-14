module Personal
	class ExerciseSetsContext
		delegate :exercise_sets, to: :user, prefix: true

		def initialize(user, attributes = {})
			@user = user
			@attributes = attributes
		end

		def presenter
			::Personal::ExerciseSetsPresenter.new
		end
		
		private

		attr_reader :user, :attributes
	end
end