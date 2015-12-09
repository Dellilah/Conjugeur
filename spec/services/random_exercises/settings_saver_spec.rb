require 'rails_helper'

describe RandomExercises::SettingsSaver do
  let(:settings) { { groups: [2], tenses: [1], excluded_verbs: "finir, grandir, rougir, divertir, raccourcir", included_verbs: "aimer"} }
  let(:session) { {} }

  subject { described_class.new(settings, session) }

  specify "#perform" do
    subject.perform
    expect(session).to have_key(:random_exercise)
    expect(session[:random_exercise]).to have_key(:forms_ids)
    expect(session[:random_exercise][:forms_ids].count).to eql(12)
  end
end
