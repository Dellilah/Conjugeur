require 'rails_helper'

describe Personal::ExerciseContext do
  let(:exercise_set) { build(:personal_exercise_set, id: 1) }
  let(:user_repetition) { build(:user_repetition, form: verb_form) }
  let(:contener) { { random_exercise: {forms_ids: [1] } } }
  let(:verb_form) { Conjugation::Form.find(1) }
  let(:presenter) { double(ExercisePresenter)}
  let(:form) { double(ExerciseForm)}

  subject { described_class.new(exercise_set) }

  before(:each) do
    allow(subject).to receive(:user_repetition) { user_repetition }
  end

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

  describe "#submit_path" do
    it "returns the right submit path" do
      expect(subject.submit_path).to eql("/zestawy-cwiczeniowe/cwicz/1")
    end
  end
end
