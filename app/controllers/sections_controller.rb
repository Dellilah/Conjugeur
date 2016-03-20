class SectionsController < ApplicationController
  def reload
    @context ||= ::SectionsContext.new(params.fetch(:exercise_settings_form, {}))
  end
end
