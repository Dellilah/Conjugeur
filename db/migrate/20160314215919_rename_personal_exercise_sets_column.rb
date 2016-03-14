class RenamePersonalExerciseSetsColumn < ActiveRecord::Migration
  def change
  	rename_column :personal_exercise_sets, :groups_ids, :groups
  end
end
