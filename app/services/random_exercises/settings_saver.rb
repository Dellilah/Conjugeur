module RandomExercises
  class SettingsSaver
    extend ::Concerns::Performable

    def initialize(settings, session)
      @settings = settings
      @session = session
    end

    def perform
      session[:random_exercise] = { forms_ids: retrieve_chosen_forms_ids }
    end

    private

    attr_reader :settings, :session

    def retrieve_chosen_forms_ids
      SettingsRetriever.new(settings).chosen_forms_ids
    end
  end
end
