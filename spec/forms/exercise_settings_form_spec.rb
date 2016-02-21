require 'rails_helper'

describe ExerciseSettingsForm do
  it { should_not allow_value([]).for(:groups) }
  it { should_not allow_value([]).for(:tenses) }
  it { should_not allow_value([Conjugation::Tense.last.id+1]).for(:tenses) }

  it { should allow_value([1, 2]).for(:included_verbs) }
end
