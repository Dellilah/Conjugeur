require 'rails_helper'

describe ExerciseContext do
  let(:params) { {} }
  let(:contener) { { random_exercise: {forms_ids: [1] } } }
  let(:verb_form) { Conjugation::Form.find(1) }
  let(:presenter) { double(ExercisePresenter)}
  let(:form) { double(ExerciseForm)}

  subject { described_class.new(params, contener) }

  describe "#form" do
    it "returns a form" do
      expect(ExerciseForm).to receive(:new).and_return(form)
      expect(subject.form).to eql(form)
    end
  end

  describe "#presenter" do
    it "returns a presenter" do
      expect(ExercisePresenter).to receive(:new).and_return(presenter)
      expect(subject.presenter).to eql(presenter)
    end
  end

  describe "#verb_form" do
    it "returns verb form" do
      expect(subject.verb_form).to eql(verb_form)
    end
  end
end
