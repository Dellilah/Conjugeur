class SectionsContext
  def initialize(params)
    @params = params
  end

  def form
    @form ||= ExerciseSettingsForm.new(params.merge(mapped_verbs))
  end

  def presenter
    @presenter ||= ExerciseFormPresenter.new(params)
  end
  
  private

  attr_reader :params

  def mapped_verbs
    {
      included_verbs: params[:included_verbs].try(:split, " "),
      excluded_verbs: params[:excluded_verbs].try(:split, " ")
    }
  end
end
