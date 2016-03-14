module Personal
  class ExerciseSetsController < ApplicationController
    before_filter :load_context

    def new
      # @context = User::ExerciseSetContext.new(params, session)
    end

    def index; end

    # def show; end

    # def edit; end

    # def update; end

    private

    def load_context
      @context = ::Personal::ExerciseSetsContext.new(current_user, params)
    end
  end
end
