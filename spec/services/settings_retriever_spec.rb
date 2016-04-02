require 'rails_helper'

describe SettingsRetriever do
  let(:settings) { 
    {
      excluded_verbs: [1, 2, 3],
      included_verbs: [4, 5, 6],
      groups: [1],
      tenses: [5, 6, 7],
      name: "foo"
    }
  }

  let(:struct) { double(OpenStruct) }

  subject { described_class.new(settings) }

  describe "#settings" do
    it "returns open struct with settings" do
      expect(OpenStruct).to receive(:new).with(settings).and_return(struct)
      expect(subject.settings).to eql(struct)
    end
  end

  describe "#verbs_ids" do
    it "returns verbs from groups&included without excluded" do
      expect(subject.verbs_ids).to eql([6, 8, 11, 14, 21, 23, 24, 32, 33, 48, 61, 62, 64, 72, 76, 88, 89, 4, 5])
    end
  end
end
