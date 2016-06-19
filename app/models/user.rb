class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :exercise_sets, 
	class_name:  "Personal::ExerciseSet", 
	foreign_key: :user_id

  has_many :user_repetitions,
  class_name: 'UserRepetition',
  foreign_key: :user_id
end
