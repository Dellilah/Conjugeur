module Verbs
  class Autocomplete
    extend ::Concerns::Performable

    def initialize(query)
      @query = query
    end

    def perform
      {
        "suggestions" => results.map{ |v| {"value" => v.infinitive, "data" => v.id} }
      }
    end

    private

    attr_reader :query

    def results
      Conjugation::Verb.all.select{ |v| v.infinitive.parameterize =~ /#{query.parameterize}/ }
    end
  end
end
