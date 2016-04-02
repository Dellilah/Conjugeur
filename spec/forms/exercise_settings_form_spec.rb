require 'rails_helper'

describe ExerciseSettingsForm do
	let(:attributes) { {} }
	subject { described_class.new(attributes) }

  it { should_not allow_value([]).for(:groups) }
  it { should_not allow_value([]).for(:tenses) }
  it { should_not allow_value([Conjugation::Tense.last.id+1]).for(:tenses) }

  it { should allow_value([1, 2]).for(:included_verbs) }

  it { should allow_value(nil).for(:name) }

  context "when personal set is true" do
		let(:attributes) { { _personal_set: true } }
  	it { should_not allow_value(nil).for(:name) }
  end
end
