require 'rails_helper'

describe ExerciseFormPresenter do
  let(:params) { {} }
  subject { described_class.new(params) }

  context "No included neither excluded verbs" do
  	specify "#included_verbs" do
	    expect(subject.included_verbs).to be_nil
	  end

	  specify "#excluded_verbs" do
	    expect(subject.excluded_verbs).to be_nil
	  end

	  specify "#partial" do
	    expect(subject.partial).to eql("included_verbs")
	  end

	  specify "#js_class" do
	    expect(subject.js_class).to eql(".x-included-verbs-container")
	  end
  end

  context "for excluded verbs" do
  	let(:params) { {excluded_verbs: "1 2 3"} }
  	let(:verbs) { [Conjugation::Verb.find(1), Conjugation::Verb.find(2), Conjugation::Verb.find(3)] }

  	specify "#included_verbs" do
	    expect(subject.included_verbs).to be_nil
	  end

	  specify "#excluded_verbs" do
	    expect(subject.excluded_verbs).to eql(verbs)
	  end

	  specify "#partial" do
	    expect(subject.partial).to eql("excluded_verbs")
	  end

	  specify "#js_class" do
	    expect(subject.js_class).to eql(".x-excluded-verbs-container")
	  end
  end

  context "for included verbs" do
  	let(:params) { {included_verbs: "1 2 3"} }
  	let(:verbs) { [Conjugation::Verb.find(1), Conjugation::Verb.find(2), Conjugation::Verb.find(3)] }

  	specify "#included_verbs" do
	    expect(subject.included_verbs).to eql(verbs)
	  end

	  specify "#excluded_verbs" do
	    expect(subject.excluded_verbs).to be_nil
	  end

	  specify "#partial" do
	    expect(subject.partial).to eql("included_verbs")
	  end

	  specify "#js_class" do
	    expect(subject.js_class).to eql(".x-included-verbs-container")
	  end
  end
end
