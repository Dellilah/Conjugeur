class CreateUserExerciseSets < ActiveRecord::Migration
  def change
    create_table :user_exercise_sets do |t|
      t.text :excluded_verbs
      t.text :included_verbs
      t.text :tenses
      t.text :groups
      t.references :user, index: true, foreign_key: true
    end
  end
end
