class CreateUserRepetitions < ActiveRecord::Migration
  def change
    create_table :user_repetitions do |t|
      t.decimal :easiness_factor
      t.integer :number_repetitions
      t.integer :quality_of_last_recall
      t.datetime :next_repetition
      t.integer :repetition_interval
      t.datetime :last_studied
      t.references :user, index: true, foreign_key: true
    end
  end
end
