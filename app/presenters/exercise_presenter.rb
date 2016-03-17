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

  def french_letters
    %w(à â æ ç é è ê ë ï î ô œ ù û ü)
  end
end
