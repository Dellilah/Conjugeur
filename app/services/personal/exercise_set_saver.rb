module Personal
  class ExerciseSetSaver
    extend ::Concerns::Performable

    def initialize(user, settings)
      @user = user
      @settings = settings
    end

    def perform
      ActiveRecord::Base.transaction do
        exercise_set = user.exercise_sets.create!(exercise_set_attributes)
        settings_retriever.chosen_forms_ids.each do |form_id|
          user.user_repetitions.create!(form_id: form_id, exercise_set: exercise_set)
        end
      end
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
