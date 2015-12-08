module Conjugation
  class Form < ActiveYaml::Base
    include ActiveHash::Associations
    extend ActiveHashWhere

    belongs_to :tense, class_name: 'Conjugation::Tense'
    belongs_to :verb, class_name: 'Conjugation::Verb'
    belongs_to :person, class_name: 'Conjugation::Person'
  end
end
