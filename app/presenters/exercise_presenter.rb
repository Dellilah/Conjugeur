class ExercisePresenter

  attr_reader :verb_form

  def initialize(verb_form)
    @verb_form = verb_form
  end

  def tense
    @tense ||= verb_form.tense.label
  end

  def verb
    @verb ||= verb_form.verb.infinitive
  end

  def person
    @person ||= verb_form.person.name
  end
end
