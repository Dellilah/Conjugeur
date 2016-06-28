class AddDefaultValuesToUserRepetitions < ActiveRecord::Migration
  def change
  	change_column :user_repetitions, :easiness_factor, :decimal, default: 2.5
  	change_column :user_repetitions, :number_repetitions, :integer, default: 0
  	change_column :user_repetitions, :next_repetition, :datetime, default: Date.today
  end
end
