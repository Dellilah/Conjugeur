module Personal
  class ExerciseSetSaver
    extend ::Concerns::Performable

    def initialize(user, settings)
      @user = user
      @settings = settings
    end

    def perform
      user.exercise_sets.create!(exercise_set_attributes)
    end

    private

    attr_reader :user, :settings
    delegate :excluded_verbs, :included_verbs, :tenses, :groups, :name, to: :settings_retriever

    def exercise_set_attributes
      {
        excluded_verbs_ids: excluded_verbs,
        included_verbs_ids: included_verbs,
        tenses_ids: tenses,
        groups: groups,
        name: name
      }
    end

    def settings_retriever
      @settings_retriever ||= SettingsRetriever.new(settings)
    end
  end
end