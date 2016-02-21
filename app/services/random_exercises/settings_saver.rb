module RandomExercises
  class SettingsSaver
    extend ::Concerns::Performable

    def initialize(settings, contener)
      @settings = settings
      @contener = contener
    end

    def perform
      contener[:random_exercise] = { forms_ids: chosen_forms_ids }
    end

    private

    attr_reader :settings, :contener

    def chosen_forms_ids
      Conjugation::Form.where_in(tense_id: tenses, verb_id: verbs).map(&:id)
    end

    def verbs
      ::ChosenVerbs.perform(groups, excluded_ids, included_ids).map(&:id)
    end

    def tenses
      settings[:tenses]
    end

    def groups
      settings[:groups]
    end

    def excluded_ids
      settings[:excluded_verbs]
    end

    def included_ids
      settings[:included_verbs]
    end
  end
end
