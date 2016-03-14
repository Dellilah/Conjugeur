require 'rails_helper'

describe Personal::ExerciseSetsPresenter do
  let(:tenses) { Conjugation::Tense.where_in(id: [1,2,3]) }
  let(:excluded) { Conjugation::Verb.where_in(id: [1,2,3]) }
  let(:included) { Conjugation::Verb.where_in(id: [4,5,6]) }

	let(:exercise_set) { build(:empty_exercise_set, 
    tenses_ids: [1,2,3], 
    groups: [1,2], 
    excluded_verbs_ids: [1,2,3],
    included_verbs_ids: [4,5,6]) }

  subject { described_class.new }

  describe "#tenses_list" do
    it "returns list of tenses names" do
      expect(subject.tenses_list(exercise_set)).to eql(tenses.map(&:label).join(", "))
    end
  end

  describe "#excluded_verbs_list" do
    it "returns list of excluded verbs infinitives" do
      expect(subject.excluded_verbs_list(exercise_set)).to eql(excluded.map(&:infinitive).join(", "))
    end
  end

  describe "#included_verbs_list" do
    it "returns list of included verbs infinitives" do
      expect(subject.included_verbs_list(exercise_set)).to eql(included.map(&:infinitive).join(", "))
    end
  end

  describe "#groups_list" do
    it "returns list of groups in roman notation" do
      expect(subject.groups_list(exercise_set)).to eql("I, II")
    end
  end
end
