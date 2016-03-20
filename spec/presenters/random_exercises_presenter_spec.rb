require 'rails_helper'

describe RandomExercisesPresenter do
  
  subject { described_class.new({}) }

  specify "#submit_path" do
    expect(subject.submit_path).to eql('/kryteria')
  end
end
