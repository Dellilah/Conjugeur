module RandomExercises
  class SettingsSaver
    extend ::Concerns::Performable

    def initialize(settings, session)
      @settings = settings
      @session = session
    end

    def perform
      session[:random_exercise] = { forms_ids: chosen_forms_ids }
    end

    private

    attr_reader :settings, :session

    def chosen_forms_ids
      Conjugation::Form.where_in(tense_id: tenses, verb_id: verbs).map(&:id)
    end

    def verbs
      ((groups_verbs & not_excluded_verbs) + included_verbs).map(&:id)
    end

    def groups_verbs
      Conjugation::Verb.where_in(group: groups)
    end

    def not_excluded_verbs
      Conjugation::Verb.where_not_in(infinitive: excluded_infinitives)
    end

    def included_verbs
      Conjugation::Verb.where_in(infinitive: included_infinitives)
    end

    def tenses
      settings[:tenses]
    end

    def groups
      settings[:groups]
    end

    def excluded_infinitives
      settings[:excluded_verbs].split(',').map(&:strip)
    end

    def included_infinitives
      settings[:included_verbs].split(',').map(&:strip)
    end
  end
end
