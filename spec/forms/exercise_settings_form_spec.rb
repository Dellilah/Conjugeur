require 'rails_helper'

describe ExerciseSettingsForm do
  it { should_not allow_value([]).for(:groups) }
  it { should_not allow_value([]).for(:tenses) }
  it { should_not allow_value([Conjugation::Tense.last.id+1]).for(:tenses) }
  it { should_not allow_value([1,2,4]).for(:groups) }

  it { should allow_value('aller, finir').for(:excluded_verbs) }
  it { should_not allow_value('aller; finir').for(:excluded_verbs) }
  it { should allow_value('aller, finir').for(:included_verbs) }
  it { should_not allow_value('aller; finir').for(:included_verbs) }
end
