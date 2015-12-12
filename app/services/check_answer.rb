class CheckAnswer
  extend ::Concerns::Performable

  def initialize(attributes)
    @attributes = attributes
  end

  def perform
    {
      result: answer_correct?,
      correct: correct_form
    }
  end

  private

  attr_reader :attributes

  def answer_correct?
    attributes[:answer] == correct_form
  end

  def correct_form
    @correct_form ||= Conjugation::Form.find(attributes[:form_id]).value
  end
end
