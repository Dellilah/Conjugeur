require 'rails_helper'

describe Personal::ExerciseSetsContext do
  let(:user) { build(:user) }
  let(:exercise_sets_presenter) { double(::Personal::ExerciseSetsPresenter) }
  let(:form) { double(::ExerciseSettingsForm) }

  subject { described_class.new(user) }

  describe "#presenter" do
    it "creates new presenter" do
      expect(::Personal::ExerciseSetsPresenter).to receive(:new).and_return(exercise_sets_presenter)
      expect(subject.presenter).to eql(exercise_sets_presenter)
    end
  end

  describe "#form" do
    it "creates new form" do
      expect(::ExerciseSettingsForm).to receive(:new).and_return(form)
      expect(subject.form).to eql(form)
    end
  end
end
