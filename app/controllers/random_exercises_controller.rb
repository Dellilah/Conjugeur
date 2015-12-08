class RandomExercisesController < ApplicationController
  before_filter :load_form

  def new; end

  def create
    if @form.valid?
      ::RandomExercises::SettingsSaver.perform(@form.attributes, session)
      redirect_to action: 'exercise'
    else
      render :new
    end
  end

  def exercise; end

  private

  def load_form
    @form = ExerciseSettingsForm.new(params.fetch(:exercise_settings_form, {}))
  end
end
