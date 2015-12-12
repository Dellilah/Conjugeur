class ExerciseContext
  def initialize(params, contener)
    @params = params
    @contener = contener
  end

  def form
    @form = ::ExerciseForm.new(params.fetch(:exercise_form, { form_id: verb_form.id }))
  end

  def presenter
    @presenter = ::ExercisePresenter.new(verb_form)
  end

  def verb_form
    @verb_form ||= Conjugation::Form.find(draw_id)
  end

  private

  attr_reader :params, :contener

  def draw_id
    contener[:random_exercise][:forms_ids].sample
  end
end
