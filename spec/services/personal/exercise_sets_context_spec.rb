require 'rails_helper'

describe Personal::ExerciseSetsContext do
  let(:user) { build(:user) }
  let(:exercise_sets_presenter) { double(::Personal::ExerciseSetsPresenter) }

  subject { described_class.new(user) }

  describe "#presenter" do
    it "creates new presenter" do
      expect(::Personal::ExerciseSetsPresenter).to receive(:new).and_return(exercise_sets_presenter)
      expect(subject.presenter).to eql(exercise_sets_presenter)
    end
  end
end
