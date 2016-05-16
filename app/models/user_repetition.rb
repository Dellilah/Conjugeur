ActiveRecord::Base.extend ActiveHash::Associations::ActiveRecordExtensions

class UserRepetition < ActiveRecord::Base
  include ::SuperMemo::SM2
  
  belongs_to :user
  belongs_to_active_hash :form, class_name: 'Conjugation::Form', foreign_key: 'form_id'
  belongs_to :exercise_set, class_name: 'Personal::ExerciseSet', foreign_key: 'personal_exercise_set_id'

end
