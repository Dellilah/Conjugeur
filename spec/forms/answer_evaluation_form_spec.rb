require 'rails_helper'

describe AnswerEvaluationForm do
  it { should validate_presence_of(:user_repetition_id) }
  it { should validate_presence_of(:quality) }
  it { should_not allow_value(0).for(:quality) }
  it { should_not allow_value(6).for(:quality) }
  it { should allow_value(3).for(:quality) }
end
