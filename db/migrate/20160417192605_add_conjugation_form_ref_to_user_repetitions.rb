class AddConjugationFormRefToUserRepetitions < ActiveRecord::Migration
  def change
    add_reference :user_repetitions, :form, index: true, foreign_key: true
  end
end
