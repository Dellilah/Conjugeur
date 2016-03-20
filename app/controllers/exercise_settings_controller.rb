class ExerciseSettingsController < ApplicationController
  before_filter :load_context

  def new; end

  def create
    if @context.form.valid?
      ::RandomExercises::SettingsSaver.perform(@context.form.attributes, session)
      redirect_to new_random_exercises_url
    else
      render :new
    end
  end

  def exercise; end

  private

  def load_context
    @context ||= ::RandomExercises::Context.new(params.fetch(:exercise_settings_form, {}))
  end
end
