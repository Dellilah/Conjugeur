require 'rails_helper'

describe SectionsContext do
	let(:params) { {included_verbs: "1 2 3"} }
  let(:form) { double(ExerciseSettingsForm, {}) }
  let(:presenter) { double(ExerciseFormPresenter, {}) }

	subject { described_class.new(params) }

	describe "#form" do
		it "returns form" do
      expect(ExerciseSettingsForm).to receive(:new).with({:included_verbs=>["1", "2", "3"], :excluded_verbs=>nil}).and_return(form)
      expect(subject.form).to eql(form)
    end
	end

	describe "#presenter" do
		it "returns presenter" do
      expect(ExerciseFormPresenter).to receive(:new).with(params).and_return(presenter)
      expect(subject.presenter).to eql(presenter)
    end
	end
end