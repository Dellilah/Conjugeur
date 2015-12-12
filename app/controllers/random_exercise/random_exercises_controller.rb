module RandomExercise
  class RandomExercisesController < ApplicationController

    def new
      @context = ExerciseContext.new(params, session)
    end

    def check
      @form = ::ExerciseForm.new(params.fetch(:exercise_form, {}))
      if check_answer[:result]
        flash[:notice] = t('.notice')
      else
        flash[:error] = t('.error', correct: check_answer[:correct])
      end
      redirect_to new_random_exercises_url
    end

    private

    def check_answer
      @check_answer ||= CheckAnswer.perform(@form.attributes)
    end
  end
end
