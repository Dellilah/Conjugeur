class AddNameToPersonalExerciseSets < ActiveRecord::Migration
  def change
    add_column :personal_exercise_sets, :name, :string
  end
end
