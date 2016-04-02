require 'rails_helper'

describe Personal::ExerciseSetSaver do
  let(:user) { build(:user) }
  let(:settings) { {} }

  subject { described_class.new(user, settings) }

  describe "#perform" do
  	before do
  		allow(subject).to receive(:exercise_set_attributes).and_return({})
  	end

    it "creates new exercise set" do
      expect(user).to receive_message_chain(:exercise_sets, :create!).with({}).and_return(true)
      expect(subject.perform).to eql(true)
    end
  end
end
