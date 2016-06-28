require 'rails_helper'

describe CheckAnswer do
  let(:attributes) { { form_id: 1, answer: answer} }
  let(:correct_form) { Conjugation::Form.find(1).value }

  subject { described_class.new(attributes) }

  describe "#perform" do
    context "with correct form given" do
      let(:answer) { correct_form }
      it "returns true" do
        expect(subject.perform).to eql({
          result: true,
          correct: correct_form,
          answer: correct_form
        })
      end
    end

    context "with incorrect form given" do
      let(:answer) { 'anotherform' }
      it "returns true" do
        expect(subject.perform).to eql({
          result: false,
          correct: correct_form,
          answer: 'anotherform'
        })
      end
    end
  end
end
