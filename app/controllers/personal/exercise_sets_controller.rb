module Personal
  class ExerciseSetsController < ApplicationController
    before_filter :load_context

    def new; end

    def index; end

    def create
      if @context.form.valid?
        ::Personal::ExerciseSetSaver.perform(current_user, @context.form.attributes)
        redirect_to exercise_sets_path
      else
        render :new
      end
    end

    # def edit; end

    # def update; end

    private

    def load_context
      @context = ::Personal::ExerciseSetsContext.new(current_user, params)
    end
  end
end
