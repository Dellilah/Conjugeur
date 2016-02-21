require 'rails_helper'

describe VerbsAvailablePolicy do
  let(:groups) { [] }
  let(:excluded) { [] }
  let(:included) { [] }

  subject { described_class.new(groups, excluded, included) }

  describe "#applies?" do
    context "with no existing verbs" do
      it "returns false" do
        expect(ChosenVerbs).to receive(:perform).and_return([])
        expect(subject.applies?).to be_falsy
      end
    end

    context "with existing verbs" do
      it "returns true" do
        expect(ChosenVerbs).to receive(:perform).and_return(["foo"])
        expect(subject.applies?).to be_truthy
      end
    end
  end
end
