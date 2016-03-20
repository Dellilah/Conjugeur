module RandomExercises
  class Context

    def initialize(params)
      @params = params
    end

    def form
      @form ||= ExerciseSettingsForm.new(params)
    end

    def presenter
      ::RandomExercisesPresenter.new(params)
    end

    private

    attr_reader :params

  end
end
