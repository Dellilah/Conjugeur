module Personal
  class ExerciseSetsContext
    delegate :exercise_sets, to: :user, prefix: true

    def initialize(user, attributes = {})
      @user = user
      @attributes = attributes
    end

    def presenter
      ::Personal::ExerciseSetsPresenter.new(attributes)
    end

    def form
      @form ||= ExerciseSettingsForm.new(mapped_attributes)
    end

    private

    attr_reader :user, :attributes

    def mapped_attributes
      exercise_settings_form_attributes.merge(
        {
          excluded_verbs: exercise_settings_form_attributes["excluded_verbs"].try(:split, " "),
          included_verbs: exercise_settings_form_attributes["included_verbs"].try(:split, " ")
        }
      )
    end

    def exercise_settings_form_attributes
      attributes.fetch("exercise_settings_form", {})
    end
  end
end