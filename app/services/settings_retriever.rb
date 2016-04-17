class SettingsRetriever
  delegate :tenses, :groups, :excluded_verbs, :included_verbs, :name, to: :settings, allow_nil: true

  def initialize(settings)
    @settings = settings
  end

  def chosen_forms_ids
    Conjugation::Form.where_in(tense_id: tenses, verb_id: verbs_ids).map(&:id)
  end

  def verbs_ids
    ::ChosenVerbs.perform(groups, excluded_verbs, included_verbs).map(&:id)
  end

  def settings
    OpenStruct.new(@settings)
  end
end
