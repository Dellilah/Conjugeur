class SettingsRetriever
  attr_reader :settings

	def initialize(settings)
    @settings = settings
  end

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

  def name
    settings.fetch(:name, "")
  end
end