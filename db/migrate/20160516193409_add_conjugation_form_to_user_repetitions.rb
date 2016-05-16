class AddConjugationFormToUserRepetitions < ActiveRecord::Migration
  def change
    add_column :user_repetitions, :form_id, :integer, index: true, foreign_key: true
  end
end
