module Conjugation
  class Form < ActiveYaml::Base
    include ActiveHash::Associations
    extend ActiveHashWhere

    belongs_to :tense, class_name: 'Conjugation::Tense'
    belongs_to :verb, class_name: 'Conjugation::Verb'
    belongs_to :person, class_name: 'Conjugation::Person'
    has_many :user_repetitions, class_name: 'UserRepetition', foreign_key: 'form_id'
  end
end
