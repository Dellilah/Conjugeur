module Personal
  class ExerciseContext
    include Rails.application.routes.url_helpers

    def initialize(exercise_set)
      @exercise_set = exercise_set
    end

    def form
      @form ||= ::ExerciseForm.new(user_repetition_id: user_repetition.id, form_id: verb_form.id)
    end

    def presenter
      @presenter ||= ::ExercisePresenter.new(verb_form)
    end

    def verb_form
      @verb_form ||= user_repetition.form
    end

    def submit_path
      check_exercise_sets_path(exercise_set)
    end

    def remote?
      true
    end

    private

    attr_reader :exercise_set

    def user_repetition
      @user_repetition ||= exercise_set.user_repetitions.order(:next_repetition, number_repetitions: :asc).first
    end
  end
end
