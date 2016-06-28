require 'rails_helper'

describe Personal::ExerciseSetSaver do
  let(:user) { build(:user) }
  let(:settings) { {} }
  let(:settings_retriever) { double(SettingsRetriever, settings) }
  let(:exercise_set) { double }

  subject { described_class.new(user, settings) }

  describe "#perform" do
  	before do
  		allow(subject).to receive(:exercise_set_attributes).and_return({})
      allow(subject).to receive(:settings_retriever).and_return(settings_retriever)
  	end

    it "creates new exercise set" do
      expect(user).to receive_message_chain(:exercise_sets, :create!).with({}).and_return(exercise_set)
      expect(settings_retriever).to receive(:chosen_forms_ids).and_return([1])
      expect(user).to receive_message_chain(:user_repetitions, :create!).with(form_id: 1, exercise_set: exercise_set).and_return(true)
      expect(subject.perform).to eql([1])
    end
  end
end
