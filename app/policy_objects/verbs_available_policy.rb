class VerbsAvailablePolicy
	def initialize(groups, excluded, included)
		@groups = groups
		@excluded = excluded
		@included = included
	end

	def applies?
    ::ChosenVerbs.perform(groups, excluded, included).any?
	end

	private

	attr_reader :groups, :excluded, :included
end