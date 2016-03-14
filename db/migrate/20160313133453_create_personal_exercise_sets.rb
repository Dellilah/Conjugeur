class CreatePersonalExerciseSets < ActiveRecord::Migration
  def change
    create_table :personal_exercise_sets do |t|
      t.text :excluded_verbs_ids
      t.text :included_verbs_ids
      t.text :tenses_ids
      t.text :groups_ids
      t.references :user, index: true, foreign_key: true
    end
  end
end
