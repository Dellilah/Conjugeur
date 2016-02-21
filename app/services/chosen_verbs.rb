class ChosenVerbs
  extend ::Concerns::Performable

  def initialize(groups, excluded, included)
    @groups = groups
    @excluded = excluded
    @included = included
  end

  def perform
    (groups_verbs + included_verbs) - excluded_verbs
  end

  private

  attr_reader :groups, :excluded, :included
 
  def groups_verbs
    Conjugation::Verb.where_in(group: groups)
  end

  def excluded_verbs
    Conjugation::Verb.where_in(id: excluded)
  end

  def included_verbs
    Conjugation::Verb.where_in(id: included)
  end
end
